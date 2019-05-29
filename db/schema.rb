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

ActiveRecord::Schema.define(version: 20190529060004) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance", primary_key: ["schedule_id", "student_id"], force: :cascade do |t|
    t.integer "schedule_id", default: 0, null: false
    t.integer "student_id", default: 0, null: false
    t.string "attend_status", limit: 10
    t.string "description", limit: 40
  end

  create_table "com", id: false, force: :cascade do |t|
    t.integer "cno"
    t.string "cname", limit: 15
    t.integer "prc"
    t.integer "sno"
  end

  create_table "course_backup", primary_key: "course_id", id: :string, limit: 20, default: "", force: :cascade do |t|
    t.string "course_title", limit: 50
    t.string "topic", limit: 100
    t.integer "day_length"
    t.integer "price", default: 0, null: false
    t.integer "level_id"
    t.string "category", limit: 40
  end

  create_table "course_searchers", primary_key: "course_id", id: :string, limit: 20, default: "", force: :cascade do |t|
    t.string "course_title", limit: 50
    t.string "topic", limit: 100
    t.integer "day_length"
    t.integer "price", default: 0, null: false
    t.integer "level_id"
    t.string "category", limit: 40
  end

  create_table "detail", primary_key: ["orderno", "itemno"], force: :cascade do |t|
    t.integer "orderno", default: 0, null: false
    t.integer "itemno", default: 0, null: false
    t.string "itemname", limit: 50, null: false
    t.integer "quantity", null: false
    t.integer "price", null: false
  end

  create_table "emp", primary_key: "empno", id: :integer, default: nil, force: :cascade do |t|
    t.string "empname", limit: 50, null: false
    t.string "dep", limit: 30
    t.string "post", limit: 30, null: false
  end

  create_table "itemorder", primary_key: "orderno", id: :integer, default: nil, force: :cascade do |t|
    t.integer "empno", null: false
    t.date "orderdate", null: false
  end

  create_table "officer", primary_key: "officerno", id: :integer, default: nil, force: :cascade do |t|
    t.string "officername", limit: 50, null: false
  end

  create_table "optimism", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 10
    t.integer "version"
  end

  create_table "partner", primary_key: "instructor_id", id: :string, limit: 11, default: "", force: :cascade do |t|
    t.string "last_name", limit: 30
    t.string "first_name", limit: 30
    t.string "e_mail", limit: 30
  end

  create_table "products", primary_key: "product_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "product_name", limit: 50, null: false
    t.integer "price", null: false
  end

  create_table "salary", primary_key: "empno", id: :integer, default: nil, force: :cascade do |t|
    t.integer "money"
  end

  create_table "schedule", primary_key: "schedule_id", id: :integer, default: nil, force: :cascade do |t|
    t.date "schedule_date"
    t.integer "classroom_id"
    t.string "course_id", limit: 11
    t.string "instructor_id", limit: 11
  end

  create_table "shops", primary_key: "shop_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "shop_name", limit: 50, null: false
  end

  create_table "sns_link", primary_key: ["id", "linked_id"], force: :cascade do |t|
    t.integer "id", null: false
    t.integer "linked_id", null: false
  end

  create_table "student", primary_key: "student_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "last_name", limit: 20
    t.string "first_name", limit: 30
    t.string "company", limit: 30
    t.string "tel", limit: 15
    t.string "e_mail", limit: 30
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
