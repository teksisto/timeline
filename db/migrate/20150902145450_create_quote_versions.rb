class CreateQuoteVersions < ActiveRecord::Migration
  def self.up

    remove_column :quotes, :content

    create_table :quote_versions do |t|
      t.integer :quote_id
      t.string  :language
      t.text    :content
      t.timestamps null: false
    end

  end

  def self.down
    add_column :quotes, :content, :text
    drop_table :quote_versions
  end
  
end
