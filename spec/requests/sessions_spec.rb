require 'rails_helper'

RSpec.describe "Sessions", type: :request do

  User.create(username: 'testuser', email: 'test@email.com', password: 'password')

  describe "GET /new" do
    it "returns http success" do
      get "/sessions/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /create" do
    context "with valid login details" do
      it "returns http 302" do
        post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'password' }
        expect(response).to have_http_status(302)
      end

      it 'redirects to the products page' do
        post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'password' }
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid login details" do
      it "returns http 302 with invalid password" do
        post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'pa5sw0rd' }
        expect(response).to have_http_status(302)
      end

      it "returns http 302 with invalid email" do
        post "/sessions", params: { 'user[email]' => 'user@email.com', 'user[password]' => 'password' }
        expect(response).to have_http_status(302)
      end

      it 'redirects to the login page' do
        post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'pa5sw0rd' }
        expect(response).to redirect_to(sessions_new_url)
      end
    end
  end

  describe "GET /destroy" do
    it "returns http 302" do
      post "/sessions", params: { 'user[email]' => 'test@email.com', 'user[password]' => 'password' }
      get "/sessions/destroy"
      expect(response).to have_http_status(302)
    end
  end
end
