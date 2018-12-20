require 'zip'
require 'rexml/document'

class EpubToc

  def self.extract(source)
    EpubToc.new(source).extract
  end

  def initialize(source)
    @source = source
  end

  def extract
    toc = nil
    Tempfile.create(['toc', '.epub']) do |tempfile|
      tempfile.binmode
      tempfile.write(@source.file.download)

      Zip::File.open(tempfile.path) do |zip_file|
        entry = zip_file.glob('**/*.ncx').first
        if entry
          toc = entry.get_input_stream.read
        else
          Rails.logger.error 'No ncx file.'
        end
      end
    end
    if toc.present?
      init_extraction(toc)
    end
  end

  def init_extraction(toc)
    doc = REXML::Document.new(toc)
    doc.elements.each('*/navMap') do |map|
      recursive(@source, map)
    end
  end

  def recursive(parent, doc)
    doc.elements.each('navPoint') do |point|
      label_node = point.elements.to_a('navLabel/text').first
      label = label_node.text.to_s
      child = Source.create(label: label, parent: parent)
      recursive(child, point)
    end
  end

end
