require 'rails_helper'

RSpec.feature 'Create Item', type: :feature do
  scenario 'Can add items to shopping list and view them' do
    login_user1
    click_button 'Add to shopping list'
    
    expect(page).to have_content('Item added to your shopping list.')

    click_link 'ShoppingList'

    expect(page).to have_content('bread')
    expect(page).to have_content(5)
    expect(page).to have_content('Left')
    expect(page).to have_content(1)
  end

  scenario 'Unable to add item to shopping list as it already exists' do
    login_user
    click_button 'Add to shopping list'
    
    expect(page).to have_content('Item not added. Its already on the list!')
  end
end
