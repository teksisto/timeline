class Quote < ActiveRecord::Base

  has_many :quote_versions
  belongs_to :source
  has_many :comments

  accepts_nested_attributes_for :quote_versions, reject_if: :all_blank, allow_destroy: true
  
end
