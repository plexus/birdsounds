# encoding: UTF-8
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

ActiveRecord::Schema.define(:version => 20120506205153) do

  create_table "bird_images", :force => true do |t|
    t.string   "latin_name"
    t.string   "url"
    t.string   "filename"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "birdsounds", :force => true do |t|
    t.string   "genus"
    t.string   "species"
    t.string   "english"
    t.string   "subspecies"
    t.string   "recordist"
    t.string   "country"
    t.string   "location"
    t.string   "latitude"
    t.string   "longitude"
    t.string   "songtype"
    t.string   "filename"
    t.string   "mp3"
    t.string   "sonogram"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
