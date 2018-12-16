class CreateCategoriesEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :categories_events, id: false do |t|
      t.belongs_to :category, index: true
      t.belongs_to :event, index: true
    end
  end
end


