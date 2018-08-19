class Api::VehiclesController < Api::BaseController
  include ApplicationHelper
    
  respond_to :json
  
  def create
    user = User.find_for_database_authentication(params)
    Vehicle.update_location_for(params[:vehicle], user.id, params[:route_id], params[:is_a_check_in])
    
    render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
    render(json: { }, status: 200)
  end
end