class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :surname_name, :encrypted_password, :name_name, :surname_kana_name, :kana_name, :birthday])
  end
  
  before_action :basic_auth


  private

  def basic_auth
    
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["BASIC_AUTH_USER"] && password == ENV["BASIC_AUTH_PASSWORD"]  
  end
end
end