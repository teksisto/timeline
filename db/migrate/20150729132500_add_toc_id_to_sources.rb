class AddTocIdToSources < ActiveRecord::Migration
  def change

    add_column :sources, :toc_id, :integer, :null => true

  end
end
