class AddDetailsUrlToEvents < ActiveRecord::Migration[5.1]
  def change

    add_column :events, :link, :text

  end
end
