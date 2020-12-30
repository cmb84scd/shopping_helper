require 'rails_helper'

RSpec.feature 'Login User', type: :feature do
  scenario 'User can login with correct credentials' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit root_url

    expect(page).to have_content 'Login'

    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq products_path
    expect(page).to have_content 'Products'
  end

  scenario 'User unable to login with incorrect email' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit root_url

    expect(page).to have_content 'Login'

    fill_in 'Email', with: 'user@email.com'
    fill_in 'Password', with: 'password'
    click_button 'Login'

    expect(current_path).to eq sessions_new_path
    expect(page).to have_content 'Email and/or password is incorrect'
  end

  scenario 'User unable to login with incorrect password' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit root_url

    expect(page).to have_content 'Login'

    fill_in 'Email', with: 'test@email.com'
    fill_in 'Password', with: 'notmypassword'
    click_button 'Login'

    expect(current_path).to eq sessions_new_path
    expect(page).to have_content 'Email and/or password is incorrect'
  end
end
