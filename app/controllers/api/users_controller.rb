class Api::UsersController < Api::BaseController
  include ApplicationHelper
    
  respond_to :json
  
  def show
    user = User.where(authentication_token: params[:token]).first
    
    render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
    render(json: { authentication_fields_for(user) }, status: 200)
  end
end