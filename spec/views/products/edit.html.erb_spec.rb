require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  before(:each) do
    @product = assign(:product, Product.create!(
      item: "MyString",
      aisle: 1,
      side: "MyString"
    ))
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(@product), "post" do

      assert_select "input[name=?]", "product[item]"

      assert_select "input[name=?]", "product[aisle]"

      assert_select "input[name=?]", "product[side]"
    end
  end
end
