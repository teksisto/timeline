class Person < ActiveRecord::Base

  has_and_belongs_to_many :authored,
                          :class_name              => Source,
                          :join_table              => 'people_sources',
                          :association_foreign_key => 'source_id',
                          :inverse_of              => :authors

  has_many :comments
  
  def screen_label
    self['screen_label'] ? self['screen_label'] : self['label']
  end
  
end
