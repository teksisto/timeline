class CategoriesForSources < ActiveRecord::Migration
  def change

    add_column :sources, :category_id, :integer
    add_column :categories, :icon, :string
    
  end
end
