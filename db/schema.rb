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

ActiveRecord::Schema.define(:version => 20130307092827) do

  create_table "cities", :force => true do |t|
    t.integer  "country_id", :null => false
    t.string   "name",       :null => false
    t.string   "slug",       :null => false
    t.string   "time_zone",  :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["country_id", "slug"], :name => "index_cities_on_country_id_and_slug"
  add_index "cities", ["country_id"], :name => "index_cities_on_country_id"

  create_table "countries", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "code",       :null => false
    t.string   "language",   :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "credit_cards", :force => true do |t|
    t.integer  "person_id",             :null => false
    t.string   "encrypted_number",      :null => false
    t.string   "encrypted_number_salt", :null => false
    t.string   "encrypted_number_iv",   :null => false
    t.string   "cardholder_name",       :null => false
    t.integer  "expiration_month",      :null => false
    t.integer  "expiration_year",       :null => false
    t.string   "first_six",             :null => false
    t.string   "last_four",             :null => false
    t.integer  "number_length",         :null => false
    t.boolean  "primary"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

  add_index "credit_cards", ["person_id"], :name => "index_credit_cards_on_person_id"

  create_table "deal_images", :force => true do |t|
    t.integer  "deal_id",    :null => false
    t.string   "url",        :null => false
    t.integer  "width",      :null => false
    t.integer  "height",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "deal_images", ["deal_id"], :name => "index_deal_images_on_deal_id"

  create_table "deals", :force => true do |t|
    t.integer  "city_id",         :null => false
    t.string   "short_title",     :null => false
    t.string   "long_title",      :null => false
    t.text     "description",     :null => false
    t.datetime "offer_starts_at", :null => false
    t.datetime "offer_ends_at",   :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "deals", ["city_id"], :name => "index_deals_on_city_id"

  create_table "options", :force => true do |t|
    t.integer  "deal_id",                                   :null => false
    t.string   "title",                                     :null => false
    t.decimal  "price",      :precision => 10, :scale => 0, :null => false
    t.decimal  "value",      :precision => 10, :scale => 0, :null => false
    t.boolean  "primary"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "options", ["deal_id"], :name => "index_options_on_deal_id"

  create_table "people", :force => true do |t|
    t.string   "email",           :null => false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "gender"
    t.date     "born_on"
    t.integer  "city_id"
  end

  add_index "people", ["email"], :name => "index_people_on_email", :unique => true

  create_table "purchases", :force => true do |t|
    t.integer  "option_id",      :null => false
    t.integer  "person_id",      :null => false
    t.integer  "credit_card_id", :null => false
    t.string   "aasm_state",     :null => false
    t.integer  "quantity",       :null => false
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "purchases", ["credit_card_id"], :name => "index_purchases_on_credit_card_id"
  add_index "purchases", ["option_id"], :name => "index_purchases_on_option_id"
  add_index "purchases", ["person_id"], :name => "index_purchases_on_person_id"

  create_table "vouchers", :force => true do |t|
    t.integer  "purchase_id",   :null => false
    t.string   "customer_code", :null => false
    t.datetime "redeemed_at"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "vouchers", ["purchase_id"], :name => "index_vouchers_on_purchase_id"

end
