require 'rails_helper'

RSpec.describe "courses_searchers/index", type: :view do
  before(:each) do
    assign(:courses_searchers, [
      CoursesSearcher.create!(),
      CoursesSearcher.create!()
    ])
  end

  it "renders a list of courses_searchers" do
    render
  end
end
