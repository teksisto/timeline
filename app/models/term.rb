class Term < ApplicationRecord

  has_and_belongs_to_many :sources,
                          class_name: 'Source',
                          join_table: 'sources_terms',
                          association_foreign_key: 'source_id',
                          inverse_of: :sources


end
