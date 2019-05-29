### actionを記述するコントローラー、Viewからパス→RouterでPathとActionに変換後にここ
### 実行後にPathのリンク先へ飛ぶ？
### 何らかの操作はここでやるのが良さそう？

class CoursesSearcherController < ApplicationController
  def top
    @query = SearchForm.new
  end

  ## 単数表示する用のaction
  def single_course
    if params[:search_result]
      @course = CourseSearcher.find(params[:search_result])
    else
      redirect_to action: 'error', error_type: 'no_result'
    end
  end

  ## 複数検索をする用のaction
  ## radio buttonによる分岐ありkeyword or category
  def multiple_list
    @query = SearchForm.new(keyword: params[:search])
    if @query.valid?
      if params[:mode] == 'keyword'
        @courses = CourseSearcher.keyword_search(params[:search])
      elsif params[:mode] == 'category'
        @courses = CourseSearcher.category_search(params[:search])
      end

      if @courses.length == 1
        redirect_to action: 'single_course', search_result: @courses.first.course_id
      elsif @courses.length == 0
        redirect_to action: 'error', error_type: 'no_result'
      end
    else
      render 'top'
    end
  end

  def index
    @courses = CourseSearcher.all
    render 'multiple_list'
  end

  def create_course
    @course = CourseSearcher.new
  end

  def create
    @course = CourseSearcher.create(course_id:    params[:course_id],
                                    course_title: params[:course_title],
                                    topic:        params[:topic],
                                    day_length:   params[:day_length],
                                    price:        params[:price],
                                    level_id:     params[:level_id],
                                    category:     params[:category]   
                                   )
    if @course.valid?
      redirect_to action: 'single_course', search_result: @course.course_id
    else
      #error messageで対応できるようにしたい
      #redirect_to action: 'error'
      render :action => 'create_course'
    end
  end

  def delete
    @delete_course = CourseSearcher.find(params[:course_id])
    @delete_course.destroy
    @delete_result = params[:course_id]
  end

  def delete_check
    # find_byだと見つからなかった場合nilを返す
    # findだと見つからなかった場合例外が発生する
    @delete_course = CourseSearcher.find_by(course_id: params[:course_id])
    if @delete_course.nil?
      redirect_to action: 'error'
    end
  end

  def update
    @course = CourseSearcher.find(params[:course_id])
    @course.update(course_title: params[:course_title],
                   topic:        params[:topic],
                   day_length:   params[:day_length],
                   price:        params[:price],
                   level_id:     params[:level_id],
                   category:     params[:category])   
    #redirect_to action: 'single_course', search_result: @new_course.course_id
    if @course.valid?
      redirect_to action: 'single_course', search_result: @course.course_id
    else
      #error messageで対応できるようにしたい
      #redirect_to action: 'error'
      render :action => 'single_course'
    end
  end

  def error
    if params[:error_type] == 'no_result'
      @message = 'This search is no result!'
    end
  end
end
