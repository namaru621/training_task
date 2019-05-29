class CreateCourseSearchers < ActiveRecord::Migration[5.1]
  def change
  create_table "course_searchers", primary_key: "course_id", id: :string, limit: 20, default: "", force: :cascade do |t|
    t.string "course_title", limit: 50
    t.string "topic", limit: 100
    t.integer "day_length"
    t.integer "price", default: 0, null: false
    t.integer "level_id"
    t.string "category", limit: 40
  end
  end
end
