class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  respond_to :json
    
  private
  
  def authenticate_user_from_token!
    user_token = params[:user_token].presence
    user       = user_token && User.find_by_authentication_token(user_token.to_s)

    if user
      sign_in user, store: false
    end
  end
end