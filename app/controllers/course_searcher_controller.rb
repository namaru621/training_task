### actionを記述するコントローラー、Viewからパス→RouterでPathとActionに変換後にここ
### 実行後にPathのリンク先へ飛ぶ？
### 何らかの操作はここでやるのが良さそう？

class CourseSearcherController < ApplicationController
  def top
  end

## 単数表示する用のaction
  def single_course
    @course = CourseSearcher.keyword_search(params[:search_result]).first
  end

## 複数検索をする用のaction
## radio buttonによる分岐ありkeyword or category
  def multiple_list
    puts params
    if params[:mode] == 'category'
      @courses = CourseSearcher.category_search(params[:search])
    else
      @courses = CourseSearcher.keyword_search(params[:search])
    end
    if @courses.length == 1
      redirect_to action: 'single_course', search_result: @courses.first.course_id
    elsif @courses.length == 1
      redirect_to action: 'error', error_type: 'no_result'
    end
  end

  def create_course
  end

  def create
    puts 'create!!!!!'
    @new_course = CourseSearcher.create(course_id:    params[:create_course_id],
                                        course_title: params[:create_course_title],
                                        topic:        params[:create_topic],
                                        day_length:   params[:create_day_length],
                                        price:        params[:create_price],
                                        level_id:     params[:create_level_id],
                                        category:     params[:create_category]   
                                       )
    redirect_to action: 'single_course', search_result: @new_course.course_id
  end

  def delete
    puts 'delete!!!!!'
    @new_course = CourseSearcher.find(params[:delete_course_id])
    @new_course.destroy
    @delete_result = params[:delete_course_id]
  end

  def delete_check
    @delete_course = CourseSearcher.find(params[:create_course_id])
  end

  def update
    if params[:delete_button]
    else
      puts 'update!!!!!'
      @new_course = CourseSearcher.find(params[:create_course_id])
      @new_course.update(course_title: params[:create_course_title],
                         topic:        params[:create_topic],
                         day_length:   params[:create_day_length],
                         price:        params[:create_price],
                         level_id:     params[:create_level_id],
                         category:     params[:create_category])   
      redirect_to action: 'single_course', search_result: @new_course.course_id
    end
  end
  def error
    if params[:error_type] == 'no_result'
      @message = 'This search is no result!'
    end
  end
end
