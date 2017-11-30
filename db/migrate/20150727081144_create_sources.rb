class CreateSources < ActiveRecord::Migration
  def change
    create_table :sources do |t|
      t.string :label
      t.text :description
      t.string :link

      t.timestamps null: false
    end
  end
end