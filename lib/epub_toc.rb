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
    toc_prefix = ''
    Tempfile.create(['toc', '.epub']) do |tempfile|
      tempfile.binmode
      tempfile.write(@source.file.download)

      Zip::File.open(tempfile.path) do |zip_file|
        entry = zip_file.glob('**/*.ncx').first
        if entry
          toc_prefix = File.dirname(entry.name)
          toc = entry.get_input_stream.read
        else
          Rails.logger.error 'No ncx file.'
        end
      end
    end
    if toc.present?
      init_extraction(toc, toc_prefix)
    end
  end

  def init_extraction(toc, toc_prefix)
    doc = REXML::Document.new(toc)
    doc.elements.each('*/navMap') do |map|
      recursive(@source, map, toc_prefix)
    end
  end

  def recursive(parent, doc, toc_prefix)
    doc.elements.each('navPoint') do |point|
      label  = extract_label(point)
      anchor = extract_anchor(point, toc_prefix)

      child = Source.create(label: label, parent: parent, anchor: anchor)

      recursive(child, point, toc_prefix)
    end
  end

  def extract_label(point)
    label_node = point.elements.to_a('navLabel/text').first
    label_node.text.to_s
  end

  def extract_anchor(point, toc_prefix)
    anchor_node = point.elements.to_a('content').first
    if sanitize_anchor(anchor_node['src'])
      anchor = File.join(toc_prefix, sanitize_anchor(anchor_node['src']))
    else
      anchor = nil
    end
    anchor
  end

  def sanitize_anchor(raw_anchor)
    array = raw_anchor.split('#')
    if array.size > 1
      return nil
    else
      return raw_anchor
    end
  end

end
