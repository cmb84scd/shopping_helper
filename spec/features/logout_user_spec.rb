require 'rails_helper'

RSpec.feature 'Log Out User', type: :feature do
  scenario 'User can log out' do
    login_user

    expect(current_path).to eq products_path
    expect(page).to have_content 'Products'

    click_link 'LogOut'
    expect(current_path).to eq root_path
    expect(page).to have_content('Successfully logged out')
  end
end
