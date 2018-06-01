class Api::RegistrationsController < Api::BaseController
  include ApplicationHelper
  
  respond_to :json
  
  def create
    user = User.new(registration_params)
    if user.save
      render json: authentication_fields_for(user), status: 200
    else
      warden.custom_failure!
      render json: error_message_for(user), status: 422
    end
  end
  
  def registration_params
    params.require(:registration).permit(:username, :email, :password)
  end
end