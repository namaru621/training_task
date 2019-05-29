require 'rails_helper'

describe CoursesSearcherController, type: :request do
  describe 'get #top' do
    before do
      FactoryBot.create :create_tester
    end

    it 'success request' do
      get '/courses_searcher'
      expect(response.status).to eq 200
    end
  end

  describe 'get #single_course' do
    context 'single_course is arraival' do
      let(:create_tester) { FactoryBot.create :create_tester }

      it 'success request' do
        #get '/courses_searcher/single_course?search_result='+create_tester.course_id
        get '/courses_searcher/single_course', params: { search_result: create_tester.course_id }
        expect(response.status).to eq 200
      end
    end
  end
end
