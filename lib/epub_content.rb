class EpubContent

  def self.extract(source)
    EpubContent.new(source).extract
  end

  def initialize(source)
    @source = source
  end

  def extract
    Tempfile.create(['source_content', '.epub']) do |tempfile|
      tempfile.binmode
      tempfile.write(@source.file.download)

      Zip::File.open(tempfile.path) do |zip_file|
        @source.descendants.each do |source|
          entry = zip_file.glob(source.anchor).first
          content = normalize_content(entry.get_input_stream.read)
          source.update_attribute(:content, content)
        end
      end

    end
  end

  def normalize_content(content)
    content = fix_encoding(content)
    content = tika_filter(content)
    content
  end

  def fix_encoding(content)
    content.force_encoding('UTF-8').encode('UTF-8', 'binary', invalid: :replace, undef: :replace, replace: '')
  end

  def tika_filter(content)
    begin
      input  = Tempfile.new(['epub_chapter_', '.html'])
      input.binmode
      input.write(content)
      input.flush

      output = Tempfile.new(['epub_chapter_content_', '.txt'])

      `bash -c "java -jar lib/tika.jar -t #{input.path} > #{output.path}"`

      content = IO.read(output.path)
    ensure
      input.close
      input.unlink

      output.close
      output.unlink
    end
    content
  end

end
