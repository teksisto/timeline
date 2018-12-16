class CreateQuotes < ActiveRecord::Migration[5.1]
  def change
    create_table :quotes do |t|
      t.string :label
      t.text :text
      t.integer :toc_id

      t.timestamps null: false
    end
  end
end
