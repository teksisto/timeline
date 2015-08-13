class CreateTocs < ActiveRecord::Migration
  def change
    create_table :tocs do |t|
      t.string :label
      t.integer :outline_id

      t.integer :parent_id, :index => true
      t.integer :lft,       :index => true
      t.integer :rgt,       :index => true

      t.integer :depth,          :default => 0
      t.integer :children_count, :default => 0

      t.timestamps null: false
    end
  end
end
