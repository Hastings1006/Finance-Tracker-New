class ApplicationController < ActionController::Base
  before_action :authenticate_user!, unless: :devise_controller?
  before_action :configure_permitted_parameters, if: :devise_controller?


  include Pundit::Authorization

  after_action :verify_authorized, unless: :skip_pundit?
  # after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?



  private

  # def skip_pundit_authorization
  #   skip_authorization
  # end

  def skip_pundit?
    devise_controller? || (params[:controller] =~ /(^(rails_)?admin)|(^pages$)/) == 0
  end


  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :email])
  end

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end


  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
