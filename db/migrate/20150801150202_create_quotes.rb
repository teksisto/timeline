class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
      t.string :title
      t.text :content
      t.integer :toc_id

      t.timestamps null: false
    end
  end
end