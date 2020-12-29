require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User input to be valid' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: 'password')
    expect(user1).to be_valid
  end

  it 'User input to be nil' do
    user1 = User.create(username: nil, email: nil, password: nil)
    expect(user1).to_not be_valid
  end

  it 'User username is nil' do
    user1 = User.create(username: nil, email: 'test@email.com', password: 'password')
    expect(user1).to_not be_valid
  end

  it 'User email is nil' do
    user1 = User.create(username: 'testuser', email: nil, password: 'password')
    expect(user1).to_not be_valid
  end

  it 'User password is nil' do
    user1 = User.create(username: 'testuser', email: 'test@email.com', password: nil)
    expect(user1).to_not be_valid
  end

  it 'User email is not valid' do
    user1 = User.create(username: 'testuser', email: 'test-email.test', password: 'password')
    expect(user1).to_not be_valid
  end

  it 'User email is not unique' do
    User.create(username: 'testuser', email: 'test@email.com', password: 'password')
    user2 = User.create(username: 'user2', email: 'test@email.com', password: 'password2')
    expect(user2).to_not be_valid
  end

  it 'Minimum length of password is 8 characters' do
    user = User.create(username: 'testuser', email: 'test@email.com', password: 'passwor')
    expect(user).to_not be_valid
  end
end
