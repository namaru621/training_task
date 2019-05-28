require 'rails_helper'

describe CoursesSearcherController, type: :request do
  describe 'get #top' do
    before do
      FactoryBot.create :test1
    end

    it 'success request' do
      get '/courses_searcher'
      expect(response.status).to eq 200
    end
  end

  describe 'get #single_course' do
    context 'single_course is arraival' do
      let(:test1) { FactoryBot.create :test1 }

      it 'success request' do
        get '/courses_searcher/single_course?search_result='+test1.course_id
        expect(response.status).to eq 200
      end
    end
  end

  describe 'post #create' do
    context 'paramater is sanity' do
      it 'success request' do
        post '/courses_searcher/create_course', params: FactoryBot.attributes_for(:test1)
        expect(response.status).to eq 302
      end

      it 'success create' do
        expect do
          post '/courses_searcher/create_course', params: FactoryBot.attributes_for(:test1) 
        end.to change(CourseSearcher, :count).by(1)
      end
    end
  end
end
