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

ActiveRecord::Schema.define(:version => 20121007114824) do

  create_table "pages", :force => true do |t|
    t.string    "title"
    t.text      "body"
    t.string    "permalink"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "retailers", :force => true do |t|
    t.string   "name"
    t.string   "training_frequency"
    t.string   "motivation_with_program"
    t.string   "informed_of_invasives"
    t.boolean  "do_not_buy_list"
    t.string   "customer_inquiry_frequency"
    t.text     "biggest_challenge"
    t.text     "educational_content_staff"
    t.text     "educational_content_customers"
    t.string   "invasives_in_past_year"
    t.text     "partnership_gain"
    t.string   "educational_importance"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.integer  "number_of_stores"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "email",                  :default => "",    :null => false
    t.string    "encrypted_password",     :default => "",    :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.string    "confirmation_token"
    t.timestamp "confirmed_at"
    t.timestamp "confirmation_sent_at"
    t.string    "unconfirmed_email"
    t.timestamp "created_at",                                :null => false
    t.timestamp "updated_at",                                :null => false
    t.boolean   "admin",                  :default => false
    t.integer   "role_id"
    t.string    "first_name"
    t.string    "last_name"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["role_id"], :name => "index_users_on_role_id"

end
