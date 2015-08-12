class Source < ActiveRecord::Base

  has_and_belongs_to_many :authors,
                          class_name: Person,
                          join_table: 'people_sources',
                          association_foreign_key: 'person_id'
  
  has_many :events
  belongs_to :category

  belongs_to :toc

  after_create :add_root_toc
  
  def add_root_toc
    create_toc(name: self.name)
  end

  def parse_toc(source)
    toc && toc.parse(source)
  end

  def quotes
    if toc
      Quote.where(toc_id: toc.descendants.select(:id))
    else
      []
    end
  end
  
end
