class Person < ActiveRecord::Base

  has_and_belongs_to_many :authored,
                          class_name: Source,
                          join_table: 'people_sources',
                          association_foreign_key: 'source_id'


  def screen_name
    self['screen_name'] ? self['screen_name'] : self['name']
  end
  
end
