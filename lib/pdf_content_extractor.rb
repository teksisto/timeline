class PdfContentExtractor

  def self.extract(source)
    PdfContentExtractor.new(source).extract
  end

  def initialize(source)
    @source = source
  end

  def extract
    source_file = Tempfile.new(['source_content', '.pdf'])
    source_file.binmode
    source_file.write(@source.file.download)

    last_page = get_pdf_page_count(source_file.path)

    descendants = @source.descendants.to_a

    for descendant_id in 0..descendants.size-1
      current   = descendants[descendant_id]
      following = descendants[descendant_id+1]

      current_anchor = current.anchor
      start_index    = current_anchor
      if following
        following_anchor = following.anchor
        end_index        = following_anchor-1
      else
        following_anchor = last_page
        end_index        = following_anchor
      end

      range_file = Tempfile.new(['source_content_range', '.pdf'])
      page_range = "#{start_index}-#{end_index}"
      `mutool convert -o #{range_file.path} #{source_file.path} #{page_range}`

      content_file = Tempfile.new(['source_content_range', '.txt'])
      `bash -c "java -jar lib/tika.jar -t #{range_file.path} > #{content_file.path}"`

      range_file.close
      range_file.unlink

      content = IO.read(content_file.path)

      content_file.close
      content_file.unlink

      current.update_attribute(:content, content)
    end

    source_file.close
    source_file.unlink
  end

  def get_pdf_page_count(path)
    raw = `bash -c "java -jar lib/tika.jar -m #{path} 2> /dev/null | grep xmpTPg:NPages"`
    page_count = raw.split(':').last.strip.to_i
    page_count
  end

  # if file.attached?
  #   output_path = "tmp/source_content_#{id}.txt"
  #   Tempfile.create('toc') do |tempfile|
  #     tempfile.binmode
  #     tempfile.write(file.download)

  #     `bash -c "java -jar lib/tika.jar -r #{tempfile.path} > #{output_path}"`

  #   end
  #   update_attribute(:content, IO.read(output_path))
  #   File.delete(output_path)
  # end

end
