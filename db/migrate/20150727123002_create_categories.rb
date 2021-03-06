class CreateCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :categories do |t|
      t.string :label
      t.text :description
      t.string :color

      t.integer :parent_id,  :index => true
      t.integer :lft,        :index => true
      t.integer :rgt,        :index => true

      t.integer :depth,           :default => 0
      t.integer :children_count,  :default => 0

      t.timestamps null: false
    end
  end
end
