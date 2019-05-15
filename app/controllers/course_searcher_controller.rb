class CourseSearcherController < ApplicationController
  def top
    @courses = CourseSearcher.where("id != '0'").search(params[:search])
    #@courses = CourseSearcher.search
  end

  def index
  end

  def multiple_list
  end

  def error
  end
end
