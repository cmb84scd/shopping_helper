require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        user: nil,
        product: nil,
        quantity: 2
      ),
      Item.create!(
        user: nil,
        product: nil,
        quantity: 2
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
