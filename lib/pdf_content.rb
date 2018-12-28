class PdfContent

  def self.extract(source)
    PdfContent.new(source).extract
  end

  def initialize(source)
    @source = source

    # Have no idea why i need to do this, but otherwise source is not
    # aware of any descendants.
    @source.reload
  end

  def extract
    begin
      source_file = Tempfile.new(['source_content', '.pdf'])
      source_file.binmode
      source_file.write(@source.file.download)

      last_page = get_pdf_page_count(source_file.path)

      descendants = @source.descendants.to_a

      for descendant_id in 0..descendants.size-1
        current   = descendants[descendant_id]
        following = descendants[descendant_id+1]

        current_anchor = current.anchor.to_i
        start_index    = current_anchor
        if following
          following_anchor = following.anchor.to_i
          end_index        = following_anchor
        else
          following_anchor = last_page
          end_index        = following_anchor
        end

        begin
          # Extracting page range for section to separate pdf.
          range_file = Tempfile.new(['source_content_range', '.pdf'])
          page_range = "#{start_index}-#{end_index}"
          `mutool convert -o #{range_file.path} #{source_file.path} #{page_range}`

          # Extracting text from section with tika.
          content_file = Tempfile.new(['source_content_range', '.txt'])
          `bash -c "java -jar lib/tika.jar -t #{range_file.path} > #{content_file.path}"`

          content = IO.read(content_file.path)

          current.update_attribute(:content, content)
        ensure
          range_file.close
          range_file.unlink

          content_file.close
          content_file.unlink
        end

      end

    ensure
      source_file.close
      source_file.unlink
    end
  end

  def get_pdf_page_count(path)
    raw = `bash -c "java -jar lib/tika.jar -m #{path} 2> /dev/null | grep xmpTPg:NPages"`
    page_count = raw.split(':').last.strip.to_i
    page_count
  end

end
