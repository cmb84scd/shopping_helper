module SpecTestHelper
  def sign_in_as(user)
    post '/sessions', params: { 'user[email]' => user.email, 'user[password]' => user.password }
  end
end
