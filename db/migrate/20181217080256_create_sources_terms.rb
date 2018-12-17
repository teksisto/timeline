class CreateSourcesTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :sources_terms, id: false do |t|
      t.belongs_to :source, index: true
      t.belongs_to :term, index: true
    end
  end
end
