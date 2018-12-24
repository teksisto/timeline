class AddContentToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :content, :text
  end
end
