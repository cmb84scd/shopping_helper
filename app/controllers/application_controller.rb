class ApplicationController < ActionController::Base
  before_action :require_login

  private

  def require_login
    return unless session[:user_id].nil?
    
    redirect_to root_url, alert: 'You must be logged in to access this section!'
  end
end
