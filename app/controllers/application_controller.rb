class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token
  # before_action :authenticate_teacher!
  # before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(_resource)
    courses_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    # Add :photo to devise_parameter_sanitizer.permit
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name photo])
    # Add :photo to devise_parameter_sanitizer.permit
    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name photo])
  end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
