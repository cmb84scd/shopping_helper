require 'rails_helper'

RSpec.feature 'Update Product', type: :feature do
  scenario 'Can edit products and view them' do
    login_user
    click_button 'Product Details'

    expect(page).to have_content 'Product Details'

    click_button 'Edit'

    expect(page).to have_content 'Update Product Information'

    fill_in 'Aisle', with: 7
    select 'Right', from: 'Side'
    click_button 'Update Product'

    expect(page).to have_content('Product was successfully updated.')
    expect(page).to have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to have_content(7)
    expect(page).to_not have_content('Left')
    expect(page).to have_content('Right')
  end

  scenario 'User leaves item empty when editing' do
    login_user
    click_button 'Product Details'

    expect(page).to have_content 'Product Details'

    click_button 'Edit'

    expect(page).to have_content 'Update Product Information'

    fill_in 'product[item_name]', with: nil
    fill_in 'Aisle', with: 7
    select 'Right', from: 'Side'
    click_button 'Update Product'

    expect(page).to have_content('1 error prevented this product from being saved:')
    expect(page).to have_content("Item name can't be blank")
  end
end
