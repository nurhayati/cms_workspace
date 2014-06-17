class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :authenticate_user!


  protected

    # configure permitted parameters when update account
    #
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :avatar, :password, :password_confirmation, :avatar) }
      devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :email, :avatar, :password, :password_confirmation) }
    end
end
