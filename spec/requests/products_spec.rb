require 'rails_helper'

RSpec.describe '/products', type: :request do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }
  let(:valid_attributes) { { item_name: 'bread', aisle: 5, side: 'Left', user_id: user1.id } }
  let(:invalid_attributes) { { item_name: nil, aisle: 5, side: 'Left', user_id: user1.id } }
  
  setup { sign_in_as user1 }

  describe 'GET /index' do
    it 'renders a successful response' do
      Product.create! valid_attributes
      get products_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      product = Product.create! valid_attributes
      get product_url(product)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_product_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      product = Product.create! valid_attributes
      get edit_product_url(product)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Product' do
        expect {
          post products_url, params: { product: valid_attributes }
        }.to change(Product, :count).by(1)
      end

      it 'redirects to the created product' do
        post products_url, params: { product: valid_attributes }
        expect(response).to redirect_to(product_url(Product.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Product' do
        expect {
          post products_url, params: { product: invalid_attributes }
        }.to change(Product, :count).by(0)
      end

      it 'renders a successful response (i.e. to display the new template)' do
        post products_url, params: { product: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { { item_name: 'bread', aisle: 8, side: 'Left' } }

      it 'updates the requested product' do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(Product.find_by(aisle: 8)).to be
      end

      it 'redirects to the product' do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: new_attributes }
        product.reload
        expect(response).to redirect_to(product_url(product))
      end
    end

    context 'with invalid parameters' do
      it 'renders a successful response (i.e. to display the edit template)' do
        product = Product.create! valid_attributes
        patch product_url(product), params: { product: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested product' do
      product = Product.create! valid_attributes
      expect {
        delete product_url(product)
      }.to change(Product, :count).by(-1)
    end

    it 'redirects to the products list' do
      product = Product.create! valid_attributes
      delete product_url(product)
      expect(response).to redirect_to(products_url)
    end
  end
end
