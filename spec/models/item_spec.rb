require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }
  let(:product1) { Product.create(item: 'bread', aisle: 5, side: 'Left', user_id: user1.id) }
  
  it 'User item input to be valid' do
    item = Item.create(user_id: user1.id, product_id: product1.id, quantity: 1)
    expect(item).to be_valid
  end
end
