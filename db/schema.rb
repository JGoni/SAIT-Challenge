# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20190206011933) do

  create_table "candies", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", default: "", null: false
    t.integer "shop_id"
    t.integer "position"
    t.integer "shelf_id"
    t.boolean "visible", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shelf_id"], name: "index_candies_on_shelf_id"
    t.index ["shop_id"], name: "index_candies_on_shop_id"
  end

  create_table "shelves", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", default: "", null: false
    t.integer "position"
    t.integer "shop_id"
    t.string "permalink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permalink"], name: "index_shelves_on_permalink"
    t.index ["shop_id"], name: "index_shelves_on_shop_id"
  end

  create_table "shops", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name", default: "", null: false
    t.integer "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
