class DropQuoteVersions < ActiveRecord::Migration[5.2]
  def change
    drop_table :quote_versions

    add_column :quotes, :translation, :text
    add_column :quotes, :original,    :text
  end
end
