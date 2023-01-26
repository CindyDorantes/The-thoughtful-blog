require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /index" do
    before(:example) { get users_path }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "response body includes correct placeholder text" do
      expect(response.body).to include 'Here is a list of USERS'
    end
  end

  describe "GET /index/:id" do
    before(:example) { get '/users/:id' }  # get(:show)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it "response body includes correct placeholder text" do
      expect(response.body).to include 'Here is the information for an individual USER'
    end
  end
end
