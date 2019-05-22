### actionを記述するコントローラー、Viewからパス→RouterでPathとActionに変換後にここ
### 実行後にPathのリンク先へ飛ぶ？
### 何らかの操作はここでやるのが良さそう？

class CoursesSearcherController < ApplicationController
  def top
  end

## 単数表示する用のaction
  def single_course
    @course = CourseSearcher.find(params[:search_result])
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
    elsif @courses.length == 0
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
    if @new_course.valid?
      redirect_to action: 'single_course', search_result: @new_course.course_id
    else
      #error messageで対応できるようにしたい
      redirect_to action: 'error' 
    end
  end

  def delete
    puts 'delete!!!!!'
    @delete_course = CourseSearcher.find(params[:delete_course_id])
    @delete_course.destroy
    @delete_result = params[:delete_course_id]
  end

  def delete_check
    # find_byだと見つからなかった場合nilを返す
    # findだと見つからなかった場合例外が発生する
    @delete_course = CourseSearcher.find_by(course_id: params[:create_course_id])
    if @delete_course.nil?
      redirect_to action: 'error'
    end
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
