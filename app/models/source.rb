class Source < ActiveRecord::Base

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



  
end
