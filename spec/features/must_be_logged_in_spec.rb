require 'rails_helper'

RSpec.feature 'Must Be Logged In', type: :feature do
  scenario 'User unable to visit product page when not logged in' do
    visit '/products'
    expect(page).to have_content('You must be logged in to access this section!')
  end

  scenario 'User unable to visit profile page when not logged in' do
    visit '/users/1'
    expect(page).to have_content('You must be logged in to access this section!')
  end
end
