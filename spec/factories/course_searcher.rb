FactoryBot.define do
  factory :test1, class: CourseSearcher do
    course_id    { "TEST-ID01" }
    course_title { "TITLE01" }
    topic        { "TOPIC01" }
    day_length   { 55 }
    price        { 55000 }
    level_id     { 3 }
    category     { "CATEGORY01" }
  end
end
