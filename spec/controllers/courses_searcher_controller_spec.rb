require 'rails_helper'

RSpec.describe CoursesSearcherController, type: :controller do
 it "get top page" do
   get :top
   expect(response.status).to eq(200)
 end
end
