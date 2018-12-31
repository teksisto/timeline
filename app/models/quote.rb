class Quote < ApplicationRecord

  has_many :comments

  belongs_to :source

  accepts_nested_attributes_for :source

  default_scope do |source_ids|
    includes(:source)
  end

  def label
    if self[:label].present?
      super
    else
      "##{id}"
    end
  end

end
