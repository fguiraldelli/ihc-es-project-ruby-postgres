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

ActiveRecord::Schema.define(version: 20161208033617) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "adminpack"

  create_table "anuncios", force: :cascade do |t|
    t.string   "titulo"
    t.text     "descricao"
    t.float    "preco"
    t.binary   "imagem"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "token"
    t.boolean  "negocio_fechado"
    t.integer  "id_usuario"
    t.binary   "imagem2"
    t.binary   "imagem3"
    t.binary   "imagem4"
    t.binary   "imagem5"
    t.integer  "visualizacoes"
    t.string   "tipoanuncio",     limit: 1
    t.datetime "datahoraevento"
    t.string   "diassemana",      limit: 7
  end

  create_table "conversas", force: :cascade do |t|
    t.integer  "id_anuncio"
    t.integer  "id_usuario_remetente"
    t.string   "mensagem"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "termos", force: :cascade do |t|
    t.string   "termo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string   "token"
    t.integer  "positivo"
    t.integer  "negativo"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "celular"
    t.integer  "id_instituicao"
    t.integer  "id_facebook",    limit: 8
    t.string   "sexo"
    t.string   "nome"
  end

end
