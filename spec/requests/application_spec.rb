require 'rails_helper'

RSpec.describe 'Application', type: :request do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }

  describe 'GET products/index' do
    it 'returns http 302' do
      get products_url
      expect(response).to have_http_status(302)
    end

    it 'redirects to the login page' do
      get products_url
      expect(response).to redirect_to(sessions_new_url)
    end
  end

  describe 'GET users/show' do
    it 'returns http 302' do
      get user_url(user1)
      expect(response).to have_http_status(302)
    end

    it 'redirects to the login page' do
      get user_url(user1)
      expect(response).to redirect_to(sessions_new_url)
    end
  end
end
