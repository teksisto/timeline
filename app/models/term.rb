class Term < ApplicationRecord

  attr_accessor :source_id

  has_and_belongs_to_many :sources,
                          class_name: 'Source',
                          join_table: 'sources_terms',
                          association_foreign_key: 'source_id',
                          inverse_of: :sources

  before_save :attach_to_source

  private

  def attach_to_source
    if source_id.present?
      sources << Source.find(source_id)
    end
  end

end
