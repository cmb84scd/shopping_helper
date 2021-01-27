require 'rails_helper'

RSpec.describe Product, type: :model do
  let(:user1) { User.create(username: 'testuser', email: 'test@email.com', password: 'password') }

  it 'User product input not to be nil' do
    product = Product.create(item_name: 'bread', aisle: 5, side: 'Left', user_id: user1.id)
    expect(product).to be_valid
  end

  it 'User item input to be nil' do
    product = Product.create(item_name: nil, aisle: 5, side: 'Left', user_id: user1.id)
    expect(product).to_not be_valid
  end
end
