class AddDetailsUrlToEvents < ActiveRecord::Migration
  def change

    add_column :events, :link, :text

  end
end
