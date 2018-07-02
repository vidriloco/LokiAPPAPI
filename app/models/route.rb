class Route < ApplicationRecord
  has_many :vehicles
  has_many :positions
  # TODO: Change to route_permissions
  has_many :tracking_allowances
  has_many :users, through: 'tracking_allowances'
  has_many :paths
  
  belongs_to :authority
  
  def authority_name
    authority.name
  end
  
  def api_fields_with(opts)
    { id: id, name: name, subtitle: description, imageUrl: image_url, color: color, stroke: stroke, paths: paths.map(&:api_fields), allowsTracking: !tracking_allowances.where(user_id: opts[:user_id]).empty? }
  end
  
  def self.discoverable_by(user)
    Route.where(is_active: true).map { |route| route.api_fields_with({ user_id: user.id }) }
  end
end
