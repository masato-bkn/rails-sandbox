class CreateComicAuthor < ActiveRecord::Migration[6.0]
  def change
    create_table :comic_authors do |t|
      t.references :comic, null: false, foreign_key: true, on_delete: :cascade
      t.references :author, null: false, foreign_key: true, on_delete: :cascade
    end
  end
end
