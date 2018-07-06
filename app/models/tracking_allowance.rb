class TrackingAllowance < ApplicationRecord
  belongs_to :route
  belongs_to :user
  
  def self.create_for(user_id, route_id)
    TrackingAllowance.create(user_id: user_id, route_id: route_id)
  end
end
