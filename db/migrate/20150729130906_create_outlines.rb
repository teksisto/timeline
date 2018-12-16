class CreateOutlines < ActiveRecord::Migration[5.1]
  def change
    create_table :outlines do |t|
      t.text :text

      t.timestamps null: false
    end
  end
end
