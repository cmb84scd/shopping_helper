require 'rails_helper'

RSpec.describe "/users", type: :request do
  let(:valid_attributes) { { username: 'testuser', email: 'test@email.com', password: 'password' } }

  let(:invalid_attributes) { { username: nil, email: nil, password: nil } }

  describe "GET /show" do
    it "renders a successful response" do
      user1 = User.create! valid_attributes
      sign_in_as user1
      get user_url(user1)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_user_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      user1 = User.create! valid_attributes
      sign_in_as user1
      get edit_user_url(user1)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post users_url, params: { user: valid_attributes }
        }.to change(User, :count).by(1)
      end

      it "redirects to the login page" do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(root_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post users_url, params: { user: invalid_attributes }
        }.to change(User, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post users_url, params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { username: 'updateuser', email: 'update@email.com', password: 'password' } }

      it "updates the requested user" do
        user1 = User.create! valid_attributes
        sign_in_as user1
        patch user_url(user1), params: { user: new_attributes }
        user1.reload
        expect(User.find_by(username: 'updateuser')).to be
        expect(User.find_by(email: 'update@email.com')).to be
      end

      it "redirects to the user" do
        user1 = User.create! valid_attributes
        sign_in_as user1
        patch user_url(user1), params: { user: new_attributes }
        user1.reload
        expect(response).to redirect_to(user_url(user1))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        user1 = User.create! valid_attributes
        sign_in_as user1
        patch user_url(user1), params: { user: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user" do
      user1 = User.create! valid_attributes
      sign_in_as user1
      expect {
        delete user_url(user1)
      }.to change(User, :count).by(-1)
    end

    it "redirects to the homepage" do
      user1 = User.create! valid_attributes
      sign_in_as user1
      delete user_url(user1)
      expect(response).to redirect_to(root_url)
    end
  end
end
