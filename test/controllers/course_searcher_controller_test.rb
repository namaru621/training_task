require 'test_helper'

class CourseSearcherControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get course_searcher_top_url
    assert_response :success
  end

  test "should get error" do
    get course_searcher_error_url
    assert_response :success
  end

end
