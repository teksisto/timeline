class RemoveToc < ActiveRecord::Migration
  def self.up

    drop_table :tocs

    remove_column :sources, :description
    remove_column :sources, :toc_id

    add_column :sources, :parent_id,      :integer, :index => true
    add_column :sources, :lft,            :integer, :index => true
    add_column :sources, :rgt,            :integer, :index => true
    add_column :sources, :depth,          :integer, :default => 0
    add_column :sources, :children_count, :integer, :default => 0

    add_column :outlines, :source_id, :integer 

    remove_column :quotes, :toc_id
    add_column    :quotes, :source_id, :integer
    
  end

  def self.down

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

    add_column :sources, :description, :text
    add_column :sources, :toc_id, :integer
    
    remove_column :sources, :parent_id
    remove_column :sources, :lft
    remove_column :sources, :rgt
    remove_column :sources, :depth
    remove_column :sources, :children_count

    remove_column :outlines, :source_id

    add_column    :quotes, :toc_id,    :integer
    remove_column :quotes, :source_id
    
  end
  
end
