require 'rails_helper'

RSpec.feature 'Delete Product', type: :feature do
  scenario 'Can delete unwanted products' do
    Product.create(item: 'bread', aisle: 5, side: 'Left')

    visit '/products'
    click_link 'Product Details'

    expect(page).to have_content 'Product Details'

    click_link 'Delete'

    expect(page).to have_content('Product was successfully deleted.')
    expect(page).to_not have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to_not have_content('Left')
  end
end
