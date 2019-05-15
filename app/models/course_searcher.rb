class CourseSearcher < ApplicationRecord
  def self.search(search)
    if search
      where(['course_title LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
