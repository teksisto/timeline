class CreateQuoteVersions < ActiveRecord::Migration[5.1]
  def self.up

    remove_column :quotes, :text

    create_table :quote_versions do |t|
      t.integer :quote_id
      t.string  :language
      t.text    :text
      t.timestamps null: false
    end

  end

  def self.down
    add_column :quotes, :text, :text
    drop_table :quote_versions
  end
  
end
