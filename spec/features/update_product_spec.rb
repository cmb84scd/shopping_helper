require 'rails_helper'

RSpec.feature 'Update Product', type: :feature do
  scenario 'Can edit products and view them' do
    Product.create(item: 'bread', aisle: 5, side: 'Left')

    visit '/'
    click_link 'Edit'

    fill_in 'Aisle', with: 7
    select 'Right', from: 'Side'
    click_button 'Update Product'

    expect(page).to have_content('bread')
    expect(page).to_not have_content(5)
    expect(page).to have_content(7)
    expect(page).to_not have_content('Left')
    expect(page).to have_content('Right')
  end
end
