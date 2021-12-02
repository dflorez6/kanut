class ApplicationController < ActionController::Base

  protect_from_forgery prepend: true
  # protect_from_forgery with: :exception

  before_action :set_locale

  # Permit other parameters for devise
  before_action :configure_permitted_parameters, if: :devise_controller?

  #==============
  # Protected Methods
  #==============
  protected
  def set_locale
    if params[:locale].blank?
      I18n.locale = :'en'
    else
      I18n.locale = params[:locale]
    end
  end

  def default_url_options(options={})
    {:locale => I18n.locale}
  end

  # Permit additional parameters for Devise
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :name, :organization_id ]) # :role_id
    # devise_invitable
    devise_parameter_sanitizer.permit(:accept_invitation, keys: [:first_name, :last_name, :name, :organization_id])
    devise_parameter_sanitizer.permit(:invite, keys: [:first_name, :last_name, :name, :organization_id])
  end

  # Allows Organizations to send User invitations also
  def authenticate_inviter!
    if organization_signed_in?
      authenticate_organization!(force: true)
    elsif user_signed_in?
      authenticate_user!(force: true)
    end
  end

  def after_accept_path_for(resource)

    if resource.sign_in_count == 1
      if user_signed_in?
        edit_user_path(current_user)
      elsif organization_signed_in?
        edit_organization_path(current_organization)
      end
    else
      root_path
    end

  end

end