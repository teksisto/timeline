require 'org_toc'

class Source < ActiveRecord::Base

  acts_as_nested_set
  
  has_and_belongs_to_many :authors,
                          class_name: Person,
                          join_table: 'people_sources',
                          association_foreign_key: 'person_id'
  
  has_one    :outline
  has_many   :quotes
  has_many   :events
  belongs_to :category
  
  include SourcesHelper
  
  def label_with_by_line
    by_line_text(self) + self.label
  end

  def parse_org_mode(org_source)

    root = OrgToc.new(content: StringIO.new(org_source).readlines, label: self.label)
    root.parse
    root.render_to_db(self)
  end
  
end
