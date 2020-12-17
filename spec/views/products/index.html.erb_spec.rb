require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        item: "Item",
        aisle: 2,
        side: "Side"
      ),
      Product.create!(
        item: "Item",
        aisle: 2,
        side: "Side"
      )
    ])
  end

  it "renders a list of products" do
    render
    assert_select "tr>td", text: "Item".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Side".to_s, count: 2
  end
end
