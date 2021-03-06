require  'org_toc'
require 'epub_toc'
require  'pdf_toc'

class Source < ApplicationRecord

  acts_as_nested_set

  has_and_belongs_to_many :authors,
                          class_name: 'Person',
                          join_table: 'people_sources',
                          association_foreign_key: 'person_id',
                          inverse_of: 'sources'

  has_and_belongs_to_many :terms,
                          class_name: 'Term',
                          join_table: 'sources_terms',
                          association_foreign_key: 'term_id',
                          inverse_of: 'sources'

  has_one    :outline
  has_many   :quotes
  has_many   :events
  belongs_to :category

  has_one_attached :cover
  has_one_attached :file

  after_create :extract_toc_from_file

  include SourcesHelper

  default_scope do
    includes(:authors)
  end

  def authors
    if root?
      super
    else
      root.authors
    end
  end

  def label_with_by_line
    by_line_text(self) + self.label
  end

  def parse_org_mode(org_source)
    root = OrgToc.new(content: StringIO.new(org_source).readlines, label: self.label)
    root.parse
    root.render_to_db(self)
  end

  def to_epub
    org_mode_path = "tmp/#{id}.org"
    File.open(org_mode_path, 'w') do |file|
      file.write(to_org_mode)
    end

    `bash -c "echo #{id}.epub | emacs25 --chdir tmp/ --batch -l ~/.emacs.d/init.el --insert #{id}.org --funcall org-epub-export-to-epub"`

    "tmp/#{id}.epub"
  end

  def clear_temp_files
    File.rm("tmp/#{id}.org")
    File.rm("tmp/#{id}.epub")
  end

  def to_org_mode()
    buffer = ''
    Source.each_with_level(self_and_descendants) do |source, level|
      buffer += '*'*(level+1) + ' ' + source.label + "\n\n"
      if source.outline
        buffer += source.outline.text + "\n\n"
      end
      if source.quotes.any?
        source.quotes.each do |quote|
          buffer += "#+BEGIN_QUOTE\n"
          buffer += quote.versions.first.text + "\n"
           buffer += "#+END_QUOTE\n"
        end
      end
    end
    buffer
  end

  def extract_toc_from_file
    if file.attached?
      Tempfile.create('toc') do |tempfile|
        tempfile.binmode
        tempfile.write(file.download)
        case FileMagic.new.file(tempfile.path)
        when /EPUB/
          klass = EpubToc
        when /PDF/
          klass = PdfToc
        end
        if klass
          klass.extract(self)
        end
      end
    end
  end

end
