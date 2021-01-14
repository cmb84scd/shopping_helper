def login_user
  user2 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')
  Product.create(item: 'bread', aisle: 5, side: 'Left', user_id: user2.id)

  visit sessions_new_url

  expect(page).to have_content 'Login'

  fill_in 'Email', with: 'test@email.com'
  fill_in 'Password', with: 'password'
  click_button 'Login'
end
