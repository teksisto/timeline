class CreateSources < ActiveRecord::Migration[5.1]
  def change
    create_table :sources do |t|
      t.string :label
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end
