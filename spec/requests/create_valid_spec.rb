require 'rails_helper'

describe CoursesSearcherController, type: :request do
  describe 'post #create' do
    context 'paramater is sanity' do
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
    context 'paramater is insanity at course_id' do
      it 'success request' do
        post '/courses_searcher/create_course', params: FactoryBot.attributes_for(:create_tester, :over_limit_course_id)
        expect(response.status).to eq 200
      end

      it 'failure create' do
        expect do
          post '/courses_searcher/create_course', params: FactoryBot.attributes_for(:create_tester, :over_limit_course_id) 
        end.to_not change(CourseSearcher, :count)
      end

      it 'print error' do
          post '/courses_searcher/create_course', params: FactoryBot.attributes_for(:create_tester, :over_limit_course_id) 
          #pending '文字コードの関係でテストが失敗するので保留しておく'
          expect(response.body).to include 'too long'
      end
    end
    context 'paramater is insanity at course_id' do
      let(:params) { FactoryBot.attributes_for(:create_tester, :over_limit_course_id) }
        post '/courses_searcher/create_course', params: params
        expect(response.status).to eq 200
    end
  end
end
