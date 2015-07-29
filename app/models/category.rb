class Category < ActiveRecord::Base

  acts_as_nested_set

  has_and_belongs_to_many :events
  has_many :sources
  
  after_create :inherit_parent_color
  after_move :inherit_parent_color

  def self.events_root
    self.roots.first
  end

  def self.sources_root
    self.roots.last
  end
  
  def inherit_parent_color
    if parent.present? && !color.present?
      update_attribute(:color, parent.color)
    end
  end
  
end
