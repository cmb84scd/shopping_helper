require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      User.create(username: 'testuser', email: 'test@email.com', password: 'password')
      post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'password' }
      expect(response).to have_http_status(302)
    end
  end

  describe "GET /destroy" do
    it "returns http 302" do
      get "/sessions/destroy"
      expect(response).to have_http_status(302)
    end
  end
end
