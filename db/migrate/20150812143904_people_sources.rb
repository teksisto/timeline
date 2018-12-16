class PeopleSources < ActiveRecord::Migration[5.1]
  def change

    create_table :people_sources, id: false do |t|
      t.belongs_to :person, index: true
      t.belongs_to :source, index: true
    end

  end
end
