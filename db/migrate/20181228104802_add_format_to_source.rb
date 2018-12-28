class AddFormatToSource < ActiveRecord::Migration[5.2]
  def change
    add_column :sources, :format, :string
  end
end
