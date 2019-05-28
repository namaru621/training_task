FactoryBot.define do
  factory :test1, class: CourseSearcher do 
    course_id    "AAABBB"
    course_title "TEST_COURSE"
    topic        "TEST"
    day_length   "5"
    price        "120000"
    level_id     "5"
    category     "TEST"
  end
end
