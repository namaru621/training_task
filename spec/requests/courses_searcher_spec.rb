require 'rails_helper'
=begin
RSpec.describe "CoursesSearcher", type: :request do
  describe "GET /courses_searcher" do
    it "works! (now write some real specs)" do
      get courses_searcher_path
      expect(response).to have_http_status(200)
    end
  end
end
=end

describe CoursesSearcherController, type: :request do
  describe 'GET #top' do
    before do
      FactoryBot.create :test1
    end

    it 'success request' do 
      get '/courses_searcher'
      expect(response.status).to eq 200
    end
  end
end
