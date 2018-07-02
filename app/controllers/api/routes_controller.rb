class Api::RoutesController < Api::BaseController
  include ApplicationHelper
    
  respond_to :json
  
  def index
    user = User.find_for_database_authentication(params)

    render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
    render json: { routes: Route.discoverable_by(user) }, status: 200
  end
  
  def vehicles
    user = User.find_for_database_authentication(params)

    render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
    render json: { vehicles: Vehicle.discoverable_by_user_on_route(user.id, params[:route_id]) }, status: 200
  end
end