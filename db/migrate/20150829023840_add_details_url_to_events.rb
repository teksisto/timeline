class AddDetailsUrlToEvents < ActiveRecord::Migration
  def change

    add_column :events, :details_url, :text

  end
end
