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

ActiveRecord::Schema.define(:version => 20130415185225) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",                                  :null => false
    t.string   "resource_type",                                :null => false
    t.integer  "author_id",     :precision => 38, :scale => 0
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "i_act_adm_com_aut_typ_aut_id"
  add_index "active_admin_comments", ["namespace"], :name => "i_act_adm_com_nam"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "i_adm_not_res_typ_res_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "i_adm_use_res_pas_tok", :unique => true

  create_table "applications", :force => true do |t|
    t.string   "name"
    t.string   "critical"
    t.string   "PBContactName"
    t.string   "PBContactNetID"
    t.integer  "PBContactPhone", :precision => 38, :scale => 0
    t.string   "PTContactName"
    t.string   "PTContactNetID"
    t.integer  "PTContactPhone", :precision => 38, :scale => 0
    t.string   "STContactName"
    t.string   "STContactNetID"
    t.integer  "STContactPhone", :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "databases", :force => true do |t|
    t.string   "name"
    t.integer  "host_id",          :precision => 38, :scale => 0
    t.integer  "primary_dba_id",   :precision => 38, :scale => 0
    t.integer  "secondary_dba_id", :precision => 38, :scale => 0
    t.integer  "port",             :precision => 38, :scale => 0
    t.integer  "server_id",        :precision => 38, :scale => 0
    t.string   "drmethod"
    t.datetime "dbcreated_on"
    t.string   "version"
    t.string   "unique_hash"
    t.string   "server_desc"
    t.datetime "created_at",                                      :null => false
    t.datetime "updated_at",                                      :null => false
  end

  create_table "dbadmins", :force => true do |t|
    t.string   "name"
    t.string   "netid"
    t.integer  "priphone",   :precision => 38, :scale => 0
    t.integer  "secphone",   :precision => 38, :scale => 0
    t.string   "email"
    t.string   "location"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "hosts", :force => true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "host_type"
    t.string   "opsystem"
    t.string   "iogroup"
    t.integer  "primary_sadmin_id",                 :precision => 38, :scale => 0
    t.integer  "secondary_sadmin_id",               :precision => 38, :scale => 0
    t.string   "purpose"
    t.datetime "created_at",                                                       :null => false
    t.datetime "updated_at",                                                       :null => false
    t.integer  "bit",                               :precision => 38, :scale => 0
    t.string   "osName"
    t.string   "ip",                  :limit => 10
    t.string   "description"
    t.string   "virtualIP"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id",   :precision => 38, :scale => 0
    t.string   "resource_type"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "i_rol_nam_res_typ_res_id"
  add_index "roles", ["name"], :name => "index_roles_on_name"

  create_table "schemas", :force => true do |t|
    t.string   "name"
    t.integer  "size",           :precision => 38, :scale => 0
    t.integer  "application_id", :precision => 38, :scale => 0
    t.integer  "database_id",    :precision => 38, :scale => 0
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
  end

  create_table "systemadmins", :force => true do |t|
    t.string   "name"
    t.string   "netid"
    t.integer  "priphone",   :precision => 38, :scale => 0
    t.integer  "secphone",   :precision => 38, :scale => 0
    t.string   "email"
    t.string   "location"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                                 :default => "", :null => false
    t.string   "encrypted_password",                                    :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :precision => 38, :scale => 0, :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                                            :null => false
    t.datetime "updated_at",                                                            :null => false
    t.string   "name"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "i_users_reset_password_token", :unique => true

  create_table "users_roles", :id => false, :force => true do |t|
    t.integer "user_id", :precision => 38, :scale => 0
    t.integer "role_id", :precision => 38, :scale => 0
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "i_users_roles_user_id_role_id"

end
