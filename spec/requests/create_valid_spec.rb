require 'rails_helper'

describe CoursesSearcherController, type: :request do
  describe 'post #create' do
    context 'paramater is correct' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 302
      end

      it 'success create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to change(CourseSearcher, :count).by(1)
      end

      it 'success redirect' do
        test = FactoryBot.build(:create_tester)
        post '/courses_searcher/create_course', params: @params
        expect(response).to redirect_to '/courses_searcher/single_course?search_result=' + test.course_id
        ### 無理やり処理しているのでなんか考える
      end
    end

    ### ここらへんのあともletでうまく実装できそう
    ### error messageをちゃんと設定していないので検証が若干面倒になっている
    ### brank errorに関連するテスト
    context 'not brank paramater at course_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_course_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Course can&#39;t be blank'
      end
    end
    context 'not brank paramater at course_title' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_course_title)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Course title can&#39;t be blank'
      end
    end
    context 'not brank paramater at topic' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_topic)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Topic can&#39;t be blank'
      end
    end
    context 'not brank paramater at price' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_price)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Price can&#39;t be blank'
      end
    end
    context 'not brank paramater at level_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_level_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Level can&#39;t be blank'
      end
    end
    context 'not brank paramater at category' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :blank_category)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'Category can&#39;t be blank'
      end
    end

    ### over limit-size
    context 'over_size paramater at course_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_size_course_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Course is too long'
      end
    end
    context 'over_size paramater at course_title' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_size_course_title)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Course title is too long'
      end
    end
    context 'over_size paramater at topic' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_size_topic)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Topic is too long'
      end
    end
    context 'over_size paramater at category' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_size_category)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Category is too long'
      end
    end

    ### over limit-value
    context 'over_limit paramater at price' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_value_price)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Price must be less than or equal'
      end
    end
    context 'over_limit paramater at level_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :over_value_level_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Level must be less than or equal'
      end
    end

    ### under limit-value
    context 'under_limit paramater at price' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :under_value_price)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Price must be greater than or equal'
      end
    end
    context 'under_limit paramater at level_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :under_value_level_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Level must be greater than or equal'
      end
    end

    ### only alphanumeric character
    context 'not only alphanumeric character at course_id' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :use_mark_course_id)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Course is invalid'
      end
    end
    context 'not only alphanumeric character at category' do
      before do 
        @params = FactoryBot.attributes_for(:create_tester, :use_mark_category)
      end
      it 'success request' do
        post '/courses_searcher/create_course', params: @params
        expect(response.status).to eq 200
      end
      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: @params 
        end.to_not change(CourseSearcher, :count)
      end
      it 'print error' do
          post '/courses_searcher/create_course', params: @params 
          expect(response.body).to include 'Category is invalid'
      end
    end
  end
end
