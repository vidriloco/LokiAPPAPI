class Api::BaseController < ActionController::Base
  protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }
  respond_to :json
    
  private
  
  def api_current_user
    User.find_by_authentication_token(params[:auth_token].presence.to_s)
  end
end