class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return @user = User.find_by(id: session[:user_id]) unless session[:user_id].nil?
    
    redirect_to sessions_new_url, alert: 'You must be logged in to access this section!'
  end
end
