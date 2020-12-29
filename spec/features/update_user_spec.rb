require 'rails_helper'

RSpec.feature 'Update User', type: :feature do
  scenario 'User can edit their information and view it' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit "users/#{user1.id}"
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

  scenario 'User can edit their information and view it' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit "users/#{user1.id}"
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
