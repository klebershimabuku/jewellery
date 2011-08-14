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
# It's strongly recommended to check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20110814075613) do
=======
ActiveRecord::Schema.define(:version => 20110811113854) do
>>>>>>> item_module

  create_table "item_parts", :force => true do |t|
    t.integer  "item_id"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity"
  end

  create_table "item_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", :force => true do |t|
    t.string   "title"
    t.decimal  "price",        :precision => 8, :scale => 2
    t.decimal  "labour_cost",  :precision => 8, :scale => 2
    t.integer  "item_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
  end

  create_table "part_types", :force => true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "quotation",  :precision => 8, :scale => 2
  end

  create_table "parts", :force => true do |t|
    t.string   "title",                                      :null => false
    t.integer  "part_type_id",                               :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "set",          :precision => 8, :scale => 2
    t.integer  "weight"
  end

end
