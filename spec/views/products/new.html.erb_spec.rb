require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      item: "MyString",
      aisle: 1,
      side: "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[item]"

      assert_select "input[name=?]", "product[aisle]"

      assert_select "input[name=?]", "product[side]"
    end
  end
end
