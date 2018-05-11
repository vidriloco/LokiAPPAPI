class Api::SessionsController < Api::BaseController
    
  before_action :ensure_params_exist
  respond_to :json
  
  def create
    resource = User.find_for_database_authentication(login: params[:session][:login])
    return invalid_login_attempt unless resource
    
    if resource.valid_password?(params[:session][:password])
      sign_in("user", resource)
      render :json=> { success: true, auth_token: resource.authentication_token, login: resource.login, email: resource.email }
      return
    end
    
    invalid_login_attempt
  end
  
  # GET /resource/sign_out
  def destroy
    set_flash_message :notice, :signed_out if signed_in?(resource_name)
    sign_out_and_redirect(resource_name)
  end

  protected
  def ensure_params_exist
    return unless params[:session].blank?
    render json: { success: false, message: "missing user_login parameter" }, status: 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: { success: false, message: "Error with your login or password" }, status: 401
  end
end