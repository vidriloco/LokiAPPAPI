class Api::TrackingAllowancesController < Api::BaseController
  include ApplicationHelper
    
  respond_to :json
  
  def create
    user = User.find_for_database_authentication(params)
    
    if user
      tracking_allowance = TrackingAllowance.create_for(user.id, params[:route_id])
      if tracking_allowance.persisted?
        render(json: { }, status: 200)
      else
        render(json: { error: "Not allowed" }, status: 422) && return if user.nil?
      end
    end
    
  end
end