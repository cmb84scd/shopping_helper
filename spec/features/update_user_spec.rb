require 'rails_helper'

RSpec.feature 'Update User', type: :feature do
  scenario 'User can edit their information and view it' do
    login_user
    click_link 'Profile'

    expect(page).to have_content 'User Profile'

    click_link 'Edit'

    expect(page).to have_content 'Update Your Details'

    fill_in 'Username', with: 'user'
    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Update User'

    expect(page).to have_content('Account was successfully updated.')
    expect(page).to_not have_content('testuser')
    expect(page).to have_content('user')
    expect(page).to_not have_content('test@email.com')
    expect(page).to have_content('user@email.com')
  end

  scenario 'User forgets to enter email when updating their details' do
    login_user
    click_link 'Profile'

    expect(page).to have_content 'User Profile'

    click_link 'Edit'

    expect(page).to have_content 'Update Your Details'

    fill_in 'Username', with: 'user'
    fill_in 'Email', with: nil
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Update User'

    expect(page).to have_content('2 errors prevented this user from being created:')
    expect(page).to have_content("Email can't be blank Email is invalid")
  end
end
