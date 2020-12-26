require 'rails_helper'

RSpec.feature 'Delete User', type: :feature do
  scenario 'User can delete their account' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')

    visit "users/#{user1.id}"

    expect(page).to have_content 'User Profile'

    click_link 'Delete Account'

    expect(page).to have_content('Account has successfully been deleted.')
    expect(page).to_not have_content('testuser')
    expect(page).to_not have_content('test@email.com')
  end
end
