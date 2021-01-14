require 'rails_helper'

RSpec.feature 'Create User', type: :feature do
  scenario 'User can create an account' do
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Username', with: 'testuser'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('Account successfully created. Please log in!')
  end

  scenario 'User did not input their username' do
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('1 error prevented this user from being created:')
    expect(page).to have_content("Username can't be blank")
  end

  scenario 'User did not input their email' do
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Username', with: 'testuser'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password'
    click_button 'Create User'

    expect(page).to have_content('2 errors prevented this user from being created:')
    expect(page).to have_content("Email can't be blank Email is invalid")
  end

  scenario 'User did not input their password' do
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Username', with: 'testuser'
    fill_in 'Email', with: 'test@email.com'
    click_button 'Create User'

    expect(page).to have_content('2 errors prevented this user from being created:')
    expect(page).to have_content("Password can't be blank Password is too short")
  end

  scenario 'User email already exists' do
    User.create(username: 'testuser1', email: 'test@email.com', password: 'password1')
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Username', with: 'testuser2'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password2'
    fill_in 'user[password_confirmation]', with: 'password2'
    click_button 'Create User'

    expect(page).to have_content('1 error prevented this user from being created:')
    expect(page).to have_content("Email has already been taken")
  end

  scenario 'User passwords do not match' do
    visit new_user_url

    expect(page).to have_content 'Create Account'

    fill_in 'Username', with: 'testuser'
    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    fill_in 'user[password_confirmation]', with: 'password1'
    click_button 'Create User'

    expect(page).to have_content('1 error prevented this user from being created:')
    expect(page).to have_content("Password confirmation doesn't match Password")
  end
end
