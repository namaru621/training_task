FactoryBot.define do
  factory :create_tester, class: CourseSearcher do
    str4valid = "0123456789"
    ### 20文字以内
    course_id    { str4valid * 2 }
    ### 50文字以内
    course_title { str4valid * 5 }
    ### 100文字以内
    topic        { str4valid * 10 }
    ### no limit
    day_length   { 55 }
    ### 0~999999
    price        { 999999 }
    ### 1~5
    level_id     { 5 }
    ### 40文字以内
    category     { str4valid * 4 }

    ### blank error(存在証明)系
    trait :blank_course_id    do course_id    { nil } end 
    trait :blank_course_title do course_title { nil } end 
    trait :blank_topic        do topic        { nil } end 
    #trait :blank_day_length   do day_length   { nil } end 
    trait :blank_price        do price        { nil } end 
    trait :blank_level_id     do level_id     { nil } end 
    trait :blank_category     do category     { nil } end 

    ### over limit-size error系
    trait :over_size_course_id    do course_id    { str4valid * 2 + "T" } end 
    trait :over_size_course_title do course_title { str4valid * 5 + "T" } end
    trait :over_size_topic        do topic        { str4valid * 10 + "T" } end
    trait :over_size_category     do category     { str4valid * 4 + "T" } end

    ### over limit-value error系
    #trait :over_value_day_length   do day_length   { nil } end 
    trait :over_value_price        do price        { 1000000 } end 
    trait :over_value_level_id     do level_id     { 6 } end 

    ### under limit-value error系
    #trait :under_value_day_length   do day_length   { nil } end 
    trait :under_value_price        do price        { -1 } end 
    trait :under_value_level_id     do level_id     { 0 } end 

    ### only alphanumeric character
    trait :use_mark_course_id    do course_id    { str4valid + "_" } end 
    trait :use_mark_category     do category     { str4valid + "_" } end 
  end
end
