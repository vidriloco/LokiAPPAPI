class Api::RegistrationsController < Api::BaseController
  
  respond_to :json
  
  def create
    user = User.new(registration_params)
    if user.save
      render json: user.authentication_fields.merge({ success: true })
      return
    else
      warden.custom_failure!
      render json: user.errors, status: 422
    end
  end
  
  def registration_params
    params.require(:registration).permit(:username, :email, :password)
  end
end