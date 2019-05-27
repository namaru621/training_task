require 'rails_helper'

RSpec.describe "courses_searcher/single_course", type: :view do
  before(:each) do
    @courses_searcher = assign(:courses_searcher, CoursesSearcher.create!())
  end

  it "renders the edit courses_searcher form" do
    render

    assert_select "form[action=?][method=?]", courses_searcher_path(@courses_searcher), "post" do
    end
  end
end
