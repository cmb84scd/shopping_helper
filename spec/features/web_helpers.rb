def login_user
  User.create(username: 'testuser', email: 'test@email.com', password: 'password')

  visit '/'

  expect(page).to have_content 'Login'

  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'password'
  click_button 'Login'
end
