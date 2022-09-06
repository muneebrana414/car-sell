class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :username, :phone_number, :password)}
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:phone_number, :username, :email, :password, :current_password)}
    devise_parameter_sanitizer.permit(:sign_in) { |u| u.permit(:login, :password)}
  end
end
