require 'rails_helper'

RSpec.feature 'Delete Item', type: :feature do
  scenario 'Can remove item from shopping list only' do
    login_user
    click_link 'ShoppingList'
    click_button 'Delete'

    expect(page).to have_content('Item was successfully deleted.')
    expect(page).to_not have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to_not have_content('Left')

    click_link 'ShoppingHelper'

    expect(page).to have_content('bread')
  end
end
