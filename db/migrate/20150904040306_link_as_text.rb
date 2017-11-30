class LinkAsText < ActiveRecord::Migration
  def change

    add_column :people, :link, :text

    remove_column :sources, :link, :string
    add_column    :sources, :link, :text

  end
end
