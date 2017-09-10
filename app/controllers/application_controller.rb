class ApplicationController < ActionController::Base
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  include Pundit

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = "You cannot perform this action."
    redirect_to(request.referrer || root_path)
  end

end
