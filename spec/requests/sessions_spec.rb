require 'rails_helper'

RSpec.describe '/sessions', type: :request do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }

  describe 'GET /new' do
    it 'returns http success' do
      get sessions_new_url
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /create' do
    context 'with valid login details' do
      it 'returns http 302' do
        post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => user1.password }
        expect(response).to have_http_status(302)
      end

      it 'redirects to the products page' do
        post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => user1.password }
        expect(response).to redirect_to(products_url)
      end
    end

    context 'with invalid login details' do
      it 'returns http 302 with invalid password' do
        post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => 'pa5sw0rd' }
        expect(response).to have_http_status(302)
      end

      it 'returns http 302 with invalid email' do
        post sessions_url, params: { 'user[email]' => 'user@email.com', 'user[password]' => user1.password }
        expect(response).to have_http_status(302)
      end

      it 'redirects to the login page' do
        post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => 'pa5sw0rd' }
        expect(response).to redirect_to(sessions_new_url)
      end
    end
  end

  describe 'GET /destroy' do
    it 'returns http 302' do
      post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => user1.password }
      get sessions_destroy_url
      expect(response).to have_http_status(302)
    end

    it 'redirects to the home page' do
      post sessions_url, params: { 'user[email]' => user1.email, 'user[password]' => user1.password }
      get sessions_destroy_url
      expect(response).to redirect_to(root_url)
    end
  end
end
