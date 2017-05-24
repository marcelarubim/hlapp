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

ActiveRecord::Schema.define(version: 20170523200742) do

  create_table "clients", force: :cascade do |t|
    t.string "business_name"
    t.string "legal_name"
    t.string "cnpj"
    t.string "telephone"
    t.string "fax"
    t.string "website"
    t.integer "month_anniversary"
    t.date "welcome_letter"
    t.string "referrer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contracts", force: :cascade do |t|
    t.date "date"
    t.integer "old_num"
    t.date "renewal_date"
    t.date "cancellation_date"
    t.text "cancellation_reason"
    t.integer "status"
    t.string "category"
    t.string "pay_method"
    t.string "language"
    t.boolean "narrator_type"
    t.string "audio_format"
    t.integer "tt_prod_contracted"
    t.integer "tt_points_contracted"
    t.integer "archiving_status"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
  end

end
