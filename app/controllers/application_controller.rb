class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # redirect to log in after signing up
  def after_sign_up_path_for(_resource)
    new_user_session_path
  end

  # redirects to home after signing in
  def after_sign_in_path_for(_resource)
    groups_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
