class CourseSearcher < ApplicationRecord
  def self.keyword_search(search)
    if search
      where(['concat(course_id, course_title, topic, day_length, price, level_id, category) LIKE ?', "%#{search}%"])
    else
      all
    end
  end

  def self.category_search(search)
    if search
      where(['category LIKE ?', "%#{search}%"])
    else
      all
    end
  end
end
