class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :label
      t.integer :year
      t.integer :month,  null: true
      t.integer :day,    null: true
      t.text :description

      t.timestamps null: false
    end
  end
end
