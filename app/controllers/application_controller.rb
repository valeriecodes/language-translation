class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter do
      resource = controller_name.singularize.to_sym
      method = "#{resource}_params"
      params[resource] &&= send(method) if respond_to?(method, true)
  end

# rescue_from ActionController::RoutingError do |exception|
#     redirect_to root_url, alert: exception.message
# end

# rescue_from Exception do |exception|
#     redirect_to root_url, alert: exception.message
# end
#
# rescue_from ActiveRecord::RecordNotFound do |exception|
#     redirect_to root_url, alert: exception.message
# end
#
# rescue_from CanCan::AccessDenied do |exception|
#     redirect_to root_url, alert: exception.message
# end

  before_action :authenticate_user!
# if user is not logged in, then page will be redirected to login page

  before_action :configure_devise_permitted_parameters, if: :devise_controller?

  alias :authorize_user! authorize!

  def access_denied(exception)
      redirect_to root_path, alert: exception.message
  end

  protected

  def configure_devise_permitted_parameters
     registration_params = [:first_name, :last_name, :email,  :username, :password, :password_confirmation, :location,
         :lang, :contact, :gender, :organization_id]

     if params[:action] == 'update'
         devise_parameter_sanitizer.for(:account_update) { |u| u.permit(registration_params << :current_password)}
     elsif params[:action] == 'create'
         devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(registration_params) }
     end
  end

end

# customising devise generated tables.

# flash messages/errors are present in config/locals/devise.en.yml
# authentification criteria, password length, etc. is present in config/initialisers/devise.rb
