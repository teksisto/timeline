class Category < ApplicationRecord

  acts_as_nested_set

  has_and_belongs_to_many :events
  has_many :sources

  after_create :inherit_parent_color
  after_move :inherit_parent_color

  def self.events_root
    self.roots.where(label: 'Event categories').first
  end

  def self.sources_root
    self.roots.where(label: 'Source categories').first
  end

  def self.locations_root
    self.roots.where(label: 'Location categories').first
  end

  def event_category?
    ancestors.include?(self.class.events_root)
  end

  def source_category?
    ancestors.include?(self.class.sources_root)
  end

  def location_category?
    ancestors.include?(self.class.locations_root)
  end

  def inherit_parent_color
    if parent.present? && !color.present?
      update_attribute(:color, parent.color)
    end
  end

end
