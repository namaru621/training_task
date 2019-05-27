require 'rails_helper'

RSpec.describe "courses_searcher/show", type: :view do
  before(:each) do
    @courses_searcher = assign(:courses_searcher, CoursesSearcher.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
