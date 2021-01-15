class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user&.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to products_url
    else
      redirect_to sessions_new_url, notice: 'Email and/or password is incorrect'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Successfully logged out'
  end
end
