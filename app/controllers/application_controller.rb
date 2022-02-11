class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
    # devise_parameter_sanitizer.for(:account_update) do |u| u.permit(:name, :last_name, :address, :email, :password, :current_password)
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: %i[name last_name address email password phone current_password])
  end
end
