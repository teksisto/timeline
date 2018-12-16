class AddTocIdToSources < ActiveRecord::Migration[5.1]
  def change

    add_column :sources, :toc_id, :integer, :null => true

  end
end
