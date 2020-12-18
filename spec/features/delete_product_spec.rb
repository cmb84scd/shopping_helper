require 'rails_helper'

RSpec.feature 'Delete Product', type: :feature do
  scenario 'Can delete unwanted products' do
    product = Product.create(item: 'bread', aisle: 5, side: 'Left')

    visit '/'
    click_link 'Delete'

    expect(page).to_not have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to_not have_content('Left')
  end
end
