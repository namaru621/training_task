class CreateCourseSearchers < ActiveRecord::Migration[5.1]
  def change
    create_table :course_searchers do |t|
      t.string :course_id
      t.string :course_title
      t.string :topic
      t.integer :day_length
      t.integer :price
      t.integer :level_id
      t.string :category

      t.timestamps
    end
  end
end
