class Vehicle < ApplicationRecord
  include Geography

  has_many :positions
  has_many :users
  belongs_to :route
  
  before_save :assign_coordinates
  
  # attributes for admin dashboard
  attr_accessor :latitude, :longitude
  
  def self.discoverable_by_user_on_route(user_id, route_id)
    # TODO: Review this logic
    # Vehicle.includes(route: { tracking_allowances: :user }).where({tracking_allowances: { allowed_to_track: true, user_id: user_id }, vehicles: { route_id: route_id }}).where.not(vehicles: { coordinates: nil }).map(&:api_fields)
    time_upper_bound = DateTime.now
    time_bottom_bound = time_upper_bound-10.minutes
    Vehicle.where(route_id: route_id, position_updated_at: time_bottom_bound..time_upper_bound).where.not(coordinates: nil).map(&:api_fields)
  end
  
  def api_fields
    coordinates = last_position.nil? ? {} : { latitude: last_position[0], longitude: last_position[1] }
    { id: id, identifier: identifier, coordinate: coordinates, description: route.description }
  end
  
  def description
    "#{route.name} - #{route.description}"
  end
  
  def coordinate=(value)
    self.direction = Path.direction_names.index(value)
  end
  
  def last_position
    return nil if lat.blank? && lon.blank?
    [lat, lon]
  end
  
  def self.update_location_for(vehicle_params, user_id, route_id, is_a_check_in)
    automatic_identifier = "R#{route_id}-U#{user_id}"
    vehicle_identifier = vehicle_params[:identifier]
    
    vehicle = Vehicle.where(identifier: vehicle_identifier).or(Vehicle.where(identifier: automatic_identifier)).first
    
    # If vehicle is not yet registered (or identifier was not given), then generate a unique vehicle ID 
    # which will be used to relate the user to this particular route and vehicle
    if vehicle.nil?
      vehicle_identifier = automatic_identifier if vehicle_identifier.blank?
      vehicle = Vehicle.create(identifier: vehicle_identifier, route_id: route_id)
    end
    
    # Add the coordinates to the list of positions of the vehicle and to it's last known position
    coordinates = "POINT(#{vehicle_params[:longitude].to_f} #{vehicle_params[:latitude].to_f})"
    vehicle.positions.create(coordinates: coordinates, user_id: user_id, route_id: route_id, is_a_check_in: is_a_check_in)
    
    vehicle.coordinates = coordinates
    vehicle.save
  end

  private
  def assign_coordinates
    self.apply_geo({ "lon" => longitude, "lat" => latitude }) 
    self.update({ position_updated_at: DateTime.now })
  end
end
