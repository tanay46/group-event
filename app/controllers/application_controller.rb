class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def home
    render :template => 'hello_world'
  end
  
end