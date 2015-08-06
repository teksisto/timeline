require 'org_toc'

class Toc < ActiveRecord::Base

  acts_as_nested_set

  belongs_to :outline
  has_many :quotes
  has_one :source
  
  def parse(toc_source)
    parse_org_mode(toc_source)
  end

  def parse_org_mode(toc_source)

    root = OrgToc.new(content: toc_source.split("\n"), title: self.name)
    root.parse
    root.render_to_db(self)
  end

end
