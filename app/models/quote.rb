class Quote < ActiveRecord::Base

  has_many   :versions,
             :class_name => QuoteVersion,
             :dependent  => :destroy,
             :inverse_of => :quote
  
  has_many   :comments

  belongs_to :source

  accepts_nested_attributes_for :versions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :source

  default_scope do |source_ids|
    includes(:versions, :source)
  end

  def label
    if self[:label].present?
      super
    else
      "##{id}"
    end
  end
  
end
