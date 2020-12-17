require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      item: "Item",
      aisle: 2,
      side: "Side"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Item/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Side/)
  end
end
