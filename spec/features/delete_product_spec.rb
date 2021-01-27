require 'rails_helper'

RSpec.feature 'Delete Product', type: :feature do
  scenario 'Can delete unwanted products' do
    login_user
    click_button 'Product Details'

    expect(page).to have_content 'Product Details'

    click_button 'Delete'

    expect(page).to have_content('Product was successfully deleted.')
    expect(page).to_not have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to_not have_content('Left')
  end
end
