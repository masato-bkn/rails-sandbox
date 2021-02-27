# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_02_20_013312) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.string "name"
  end

  create_table "comic_authors", force: :cascade do |t|
    t.integer "comic_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id"], name: "index_comic_authors_on_author_id"
    t.index ["comic_id"], name: "index_comic_authors_on_comic_id"
  end

  create_table "comics", force: :cascade do |t|
    t.string "title"
    t.integer "type"
  end

  add_foreign_key "comic_authors", "authors"
  add_foreign_key "comic_authors", "comics"
end
