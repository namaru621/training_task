require 'rails_helper'

RSpec.describe "courses_searchers/new", type: :view do
  before(:each) do
    assign(:courses_searcher, CoursesSearcher.new())
  end

  it "renders new courses_searcher form" do
    render

    assert_select "form[action=?][method=?]", courses_searchers_path, "post" do
    end
  end
end
