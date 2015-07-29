class CreateOutlines < ActiveRecord::Migration
  def change
    create_table :outlines do |t|
      t.text :content

      t.timestamps null: false
    end
  end
end
