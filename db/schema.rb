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

ActiveRecord::Schema.define(version: 20170709115352) do

  create_table "addresses", force: :cascade do |t|
    t.string "address"
    t.integer "num"
    t.string "complement"
    t.string "district"
    t.string "city"
    t.string "zip_code"
    t.string "state"
    t.string "country"
    t.integer "addressable_id"
    t.string "addressable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["addressable_type", "addressable_id"], name: "index_addresses_on_addressable_type_and_addressable_id"
  end

  create_table "client_categories", force: :cascade do |t|
    t.string "name"
    t.string "sector"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "business_name"
    t.string "legal_name"
    t.string "cnpj"
    t.string "telephone"
    t.string "fax"
    t.string "website"
    t.string "month_anniversary"
    t.date "welcome_letter"
    t.string "referrer"
    t.integer "category_id"
    t.integer "seller_id"
    t.integer "captured_by_id"
    t.integer "telemarketing_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["captured_by_id"], name: "index_clients_on_captured_by_id"
    t.index ["category_id"], name: "index_clients_on_category_id"
    t.index ["seller_id"], name: "index_clients_on_seller_id"
    t.index ["telemarketing_id"], name: "index_clients_on_telemarketing_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "text"
    t.integer "status"
    t.integer "commentable_id"
    t.string "commentable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "fullname"
    t.string "position"
    t.string "telephone"
    t.string "mobile"
    t.string "email"
    t.date "birthday"
    t.string "responsible_for"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contacts_on_client_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "date"
    t.integer "old_num"
    t.date "renewal_date"
    t.date "cancellation_date"
    t.text "cancellation_reason"
    t.integer "status", default: 0
    t.integer "category", default: 0
    t.integer "archiving_status", default: 0
    t.integer "narrator_type", default: 0
    t.string "pay_method"
    t.string "language"
    t.string "audio_format"
    t.integer "tt_prod_contracted"
    t.integer "tt_inst_contracted"
    t.integer "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_contracts_on_client_id"
  end

  create_table "fluxes", force: :cascade do |t|
    t.text "notes"
    t.integer "fluxable_id"
    t.string "fluxable_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["fluxable_type", "fluxable_id"], name: "index_fluxes_on_fluxable_type_and_fluxable_id"
  end

  create_table "installations", force: :cascade do |t|
    t.string "code"
    t.string "language"
    t.string "install_phone"
    t.string "gr_qc"
    t.string "pabx"
    t.integer "status"
    t.integer "equipment"
    t.integer "guarantee_type"
    t.date "delivery_date"
    t.date "guarantee_limit"
    t.integer "service_id"
    t.integer "responsible_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["responsible_id"], name: "index_installations_on_responsible_id"
    t.index ["service_id"], name: "index_installations_on_service_id"
  end

  create_table "ops", force: :cascade do |t|
    t.string "narrator"
    t.string "language"
    t.string "track"
    t.integer "kind"
    t.integer "process_phase"
    t.integer "status"
    t.integer "priority"
    t.date "briefing_date"
    t.date "max_delivery_date"
    t.date "text_delivery_date"
    t.date "text_approving_date"
    t.date "recording_date"
    t.date "demo_delivery_date"
    t.date "demo_approving_date"
    t.date "studio_release_date"
    t.integer "contract_id"
    t.integer "solicitant_id"
    t.integer "text_approver_id"
    t.integer "comun_executor_id"
    t.integer "studio_executor_id"
    t.integer "editor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["comun_executor_id"], name: "index_ops_on_comun_executor_id"
    t.index ["contract_id"], name: "index_ops_on_contract_id"
    t.index ["editor_id"], name: "index_ops_on_editor_id"
    t.index ["solicitant_id"], name: "index_ops_on_solicitant_id"
    t.index ["studio_executor_id"], name: "index_ops_on_studio_executor_id"
    t.index ["text_approver_id"], name: "index_ops_on_text_approver_id"
  end

  create_table "osts", force: :cascade do |t|
    t.integer "status"
    t.integer "type"
    t.date "program_date"
    t.date "service_execution_date"
    t.date "qc_date"
    t.integer "service_method"
    t.string "complain"
    t.string "defects"
    t.integer "repair_status"
    t.boolean "equip_replaced"
    t.integer "installed_qty"
    t.integer "collected_qty"
    t.integer "product_evaluation"
    t.integer "installation_id"
    t.integer "executor_id"
    t.integer "attendant_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attendant_id"], name: "index_osts_on_attendant_id"
    t.index ["executor_id"], name: "index_osts_on_executor_id"
    t.index ["installation_id"], name: "index_osts_on_installation_id"
  end

  create_table "product_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "productions", force: :cascade do |t|
    t.string "theme"
    t.string "airing_month"
    t.string "renew_forecast_month"
    t.string "details"
    t.integer "service_id"
    t.integer "op_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["op_id"], name: "index_productions_on_op_id"
    t.index ["service_id"], name: "index_productions_on_service_id"
  end

  create_table "service_product_variations", force: :cascade do |t|
    t.integer "service_type_id"
    t.integer "product_type_id"
    t.integer "variation_type_id"
    t.boolean "var_required", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_type_id"], name: "index_service_product_variations_on_product_type_id"
    t.index ["service_type_id"], name: "index_service_product_variations_on_service_type_id"
    t.index ["variation_type_id"], name: "index_service_product_variations_on_variation_type_id"
  end

  create_table "service_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "courtesy"
    t.integer "contract_id"
    t.integer "service_product_variation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["contract_id"], name: "index_services_on_contract_id"
    t.index ["service_product_variation_id"], name: "index_services_on_service_product_variation_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "fullname"
    t.string "cpf"
    t.string "rg"
    t.string "work_doc"
    t.integer "marital_status", default: 0
    t.date "birthday"
    t.string "telephone"
    t.string "mobile"
    t.date "hire_date"
    t.date "resignation_date"
    t.string "email"
    t.string "position"
    t.string "login"
    t.integer "role", default: 0
    t.boolean "status", default: true
    t.string "password_digest"
    t.string "remember_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cpf"], name: "index_users_on_cpf", unique: true
  end

  create_table "variation_types", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "item_type", null: false
    t.integer "item_id", null: false
    t.string "event", null: false
    t.string "whodunnit"
    t.text "object", limit: 1073741823
    t.datetime "created_at"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

end
