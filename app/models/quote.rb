class Quote < ActiveRecord::Base

  has_many   :quote_versions
  has_many   :comments
  belongs_to :source

  accepts_nested_attributes_for :quote_versions, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :source

  default_scope do |source_ids|
    includes(:quote_versions, :source)
  end
  
end
