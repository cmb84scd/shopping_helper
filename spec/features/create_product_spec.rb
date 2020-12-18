require 'rails_helper'

RSpec.feature 'Create Product', type: :feature do
  scenario 'Can submit products and view them' do
    visit '/'
    click_link 'New Product'

    fill_in 'Item', with: 'bread'
    fill_in 'Aisle', with: 5
    select 'Left', from: 'Side'
    click_button 'Create Product'

    expect(page).to have_content('bread')
    expect(page).to have_content(5)
    expect(page).to have_content('Left')
  end

  scenario 'Unable to submit products as Item field is blank' do
    visit '/'
    click_link 'New Product'

    fill_in 'Aisle', with: 5
    select 'Left', from: 'Side'
    click_button 'Create Product'

    expect(page).to have_content('1 error prevented this product from being saved:')
    expect(page).to have_content("Item can't be blank")
  end
end
