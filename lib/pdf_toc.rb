class PdfToc

  def self.extract(source)
    PdfToc.new(source).extract
  end

  def initialize(source)
    @source = source
  end

  def extract
    Tempfile.create(['toc', '.pdf']) do |tempfile|
      tempfile.binmode
      tempfile.write(@source.file.download)
      raw_toc = `mutool show #{tempfile.path} outline`

      org_toc = pdf_raw_toc_to_org_toc(raw_toc)

      root = OrgToc.new(content: org_toc, label: @source.label)
      root.parse
      root.render_to_db(@source)
    end
  end

  def pdf_raw_toc_to_org_toc(toc)
    toc.split("\n").map do |line|
      match = line.match(/^\t+/)
      if match
        level = match.to_a.first.size + 1
        line = line.gsub(/^\t+/, '*'*level+' ')
      else
        line = line.gsub(/^/, '* ')
      end
      line.split("\t").first
    end
  end

end
