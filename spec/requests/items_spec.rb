require 'rails_helper'

RSpec.describe "/items", type: :request do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }
  let(:product1) { Product.create(item_name: 'bread', aisle: 5, side: 'Left', user_id: user1.id) }
  let(:valid_attributes) { { user_id: user1.id, product_id: product1.id, quantity: 1 } }

  setup { sign_in_as user1 }

  describe "GET /index" do
    it "renders a successful response" do
      Item.create! valid_attributes
      get items_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_item_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "render a successful response" do
      item = Item.create! valid_attributes
      get edit_item_url(item)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Item" do
        expect {
          post items_url, params: { product_id: product1.id }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post items_url, params: { product_id: product1.id }
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Item" do
        item = Item.create! valid_attributes
        expect {
          post items_url, params: { product_id: product1.id }
        }.to change(Item, :count).by(0)
      end

      it "renders a redirect response (i.e. to display the products template)" do
        item = Item.create! valid_attributes
        post items_url, params: { product_id: product1.id }
        expect(response).to redirect_to(products_url)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { user_id: user1.id, product_id: product1.id, quantity: 2 } }

      it "updates the requested item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(Item.find_by(quantity: 2)).to be
      end

      it "redirects to the item" do
        item = Item.create! valid_attributes
        patch item_url(item), params: { item: new_attributes }
        item.reload
        expect(response).to redirect_to(items_url)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested item" do
      item = Item.create! valid_attributes
      expect {
        delete item_url(item)
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      item = Item.create! valid_attributes
      delete item_url(item)
      expect(response).to redirect_to(items_url)
    end
  end
end
