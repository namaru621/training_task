FactoryBot.define do
  factory :create_tester, class: CourseSearcher do
    str4valid = "0123456789"
    ### 20文字以内
    course_id    { str4valid * 2 }
    ### 50文字以内
    course_title { str4valid * 5 }
    ### 100文字以内
    topic        { str4valid * 10 }
    day_length   { 55 }
    ### 0~999999
    price        { 999999 }
    ### 1~5
    level_id     { 5 }
    ### 40文字以内
    category     { str4valid * 4 }
    ### invalid error(存在証明)系
    trait :invalid_course_id    do course_id    { nil } end 
    trait :invalid_course_title do course_title { nil } end 
    trait :invalid_topic        do topic        { nil } end 
    trait :invalid_day_length   do day_length   { nil } end 
    trait :invalid_price        do price        { nil } end 
    trait :invalid_level_id     do level_id     { nil } end 
    trait :invalid_category     do category     { nil } end 
    ### over limit-size error系
    trait :over_limit_course_id    do course_id    { str4valid * 2 + "T" } end 
    trait :over_limit_course_title do course_title { str4valid * 5 + "T" } end
    trait :over_limit_topic        do topic        { str4valid * 10 + "T" } end 
    trait :over_limit_category     do category     { str4valid * 4 + "T" } end
  end
end
