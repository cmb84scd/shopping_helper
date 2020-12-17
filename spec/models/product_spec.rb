require 'rails_helper'

RSpec.describe Product, type: :model do
  it 'User product input not to be nil' do
    product = Product.create(item: 'bread', aisle: 5, side: 'left')
    expect(product).to be_valid
  end

  it 'User product input to be nil' do
    product = Product.create(item: nil)
    expect(product).to_not be_valid
  end
end
