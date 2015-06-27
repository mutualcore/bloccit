class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :flash_attack
  
  def flash_attack
    flash[:notice] = "Test flash"
  end
  protect_from_forgery with: :exception
end
