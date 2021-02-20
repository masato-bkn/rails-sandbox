class AddTypeToComics < ActiveRecord::Migration[6.0]
  def change
    add_column :comics, :type, :interger
  end
end
