class AddAnchorToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :anchor, :string
  end
end
