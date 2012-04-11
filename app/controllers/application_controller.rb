class ApplicationController < ActionController::Base
  protect_from_forgery
  
  force_ssl
  before_filter :authorize
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
  
  def home
    render :template => 'hello_world'
  end
  
  protected
  def authorize
    unless User.find_by_id(session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end
  
end