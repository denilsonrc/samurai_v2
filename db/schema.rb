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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160519225508) do

  create_table "equipamentos", force: :cascade do |t|
    t.string   "nome"
    t.string   "mac"
    t.string   "ip"
    t.string   "status"
    t.integer  "sala_id"
    t.integer  "tipo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text     "descricao"
    t.string   "protocolo"
  end

  add_index "equipamentos", ["sala_id"], name: "index_equipamentos_on_sala_id"
  add_index "equipamentos", ["tipo_id"], name: "index_equipamentos_on_tipo_id"

  create_table "historico_equipamentos", force: :cascade do |t|
    t.string   "status"
    t.float    "tempo"
    t.integer  "equipamento_id"
    t.integer  "sala_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "historico_equipamentos", ["equipamento_id"], name: "index_historico_equipamentos_on_equipamento_id"
  add_index "historico_equipamentos", ["sala_id"], name: "index_historico_equipamentos_on_sala_id"

  create_table "salas", force: :cascade do |t|
    t.string   "nome"
    t.string   "numero"
    t.string   "andar"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tipos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
