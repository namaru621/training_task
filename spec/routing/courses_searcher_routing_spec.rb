require "rails_helper"

RSpec.describe CoursesSearcherController, type: :routing do
  describe "routing" do
    it "routes to #top" do
      expect(:get => "/courses_searcher/top").to route_to("courses_searcher#top")
    end

    it "routes to #multiple_list" do
      expect(:get => "/courses_searcher/multiple_list").to route_to("courses_searcher#multiple_list")
    end

    it "routes to #single_course" do
      expect(:get => "/courses_searcher/single_course?search_result=KDC-UX01").to route_to("courses_searcher#single_course", :search_result => "KDC-UX01")
    end

    it "routes to #create_course" do
      expect(:get => "/courses_searcher/create_course").to route_to("courses_searcher#create_course")
    end


    it "routes to #create" do
      expect(:post => "/courses_searcher/create_course").to route_to("courses_searcher#create")
    end
=begin
    it "routes to #update via PUT" do
      expect(:put => "/courses_searcher/1").to route_to("courses_searcher#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/courses_searcher/1").to route_to("courses_searcher#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/courses_searcher/1").to route_to("courses_searcher#destroy", :id => "1")
    end
=end
  end
end
