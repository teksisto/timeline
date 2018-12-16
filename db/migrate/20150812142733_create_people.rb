class CreatePeople < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |t|
      t.string :label
      t.text :description

      t.timestamps null: false
    end
  end
end
