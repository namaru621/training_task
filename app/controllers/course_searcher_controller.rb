class CourseSearcherController < ApplicationController
  def top
  end

  def index
  end

  def multiple_list
    @courses = CourseSearcher.where("id != '0'").search(params[:search])
  end

  def error
  end
end
