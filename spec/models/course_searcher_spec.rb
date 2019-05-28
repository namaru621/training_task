require 'rails_helper'

RSpec.describe CourseSearcher, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "is valid with course_id, course_title, topic, day_length, price, level_id and category" do 
    cs = CourseSearcher.new(course_id:    "KDC-UX01-02",
                            course_title: "Unix introduction",
                            topic:        "BASIC Unix introduction course",
                            day_length:   3,
                            price:        90000,
                            level_id:     1,
                            category:     "LINUX")
    expect(cs).to be_valid
  end
end
