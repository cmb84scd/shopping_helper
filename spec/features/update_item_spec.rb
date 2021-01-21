require 'rails_helper'

RSpec.feature 'Update Item', type: :feature do
  scenario 'Can update item quantities and view them' do
    login_user
    click_link 'ShoppingList'

    expect(page).to have_content 'Shopping List'

    click_link 'Edit'

    expect(page).to have_content 'Item Details'

    fill_in 'Quantity', with: 2
    click_button 'Update Item'

    expect(page).to have_content('Item was successfully updated.')
    expect(page).to have_content('bread')
    expect(page).to have_content(5)
    expect(page).to have_content('Left')
    expect(page).to have_content(2)
  end
end
