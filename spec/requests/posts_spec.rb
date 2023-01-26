require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /users/:user_id/posts" do
    before(:example) { get '/users/:user_id/posts' }  # get(:index)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it "response body includes correct placeholder text" do
      expect(response.body).to include 'Here is the list of posts for a given USER'
    end
  end

  describe "GET /users/:user_id/posts/:id" do
    before(:example) { get '/users/:user_id/posts/:id' }  # get(:show)
    it "is a success" do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it "response body includes correct placeholder text" do
      expect(response.body).to include 'Here is the complete post information'
    end
  end
end
