class Route < ApplicationRecord
  has_many :vehicles
  has_many :positions
  has_many :tracking_allowances
  has_many :users, through: 'tracking_allowances'
  has_many :paths
  
  belongs_to :authority
  
  def authority_name
    authority.name
  end
  
  def api_fields
    { id: id, name: name, subtitle: description, imageUrl: image_url, paths: paths }
  end
  
  def self.discoverable_by(user)
    Route.includes(tracking_allowances: :user).where({tracking_allowances: { allowed_to_track: true }, routes: { is_active: true }, tracking_allowances: { user_id: user.id }}).map(&:api_fields)
  end
end
