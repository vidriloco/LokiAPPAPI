class Api::RoutesController < Api::BaseController
  include ApplicationHelper
    
  respond_to :json
  
  def index
    user = User.first
    
    #render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
    render json: { routes: Route.discoverable_by(user) }, status: 200
  end
  
end