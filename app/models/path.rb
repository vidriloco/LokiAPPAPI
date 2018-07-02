class Path < ApplicationRecord
  belongs_to :route
    
  def self.direction_names
    ["Inbound", "Outbound", "Both"]
  end
  
  def self.direction_symbols
    [:inbound, :outbound, :both]
  end
  
  def direction_name=(value)
    self.direction = Path.direction_names.index(value)
  end
  
  def direction_name
    Path.direction_names[direction || Path.direction_symbols.index(:both)]
  end
  
  def direction_symbol
    Path.direction_symbols[direction]
  end
  
  def api_fields
    { coordinates: hash_components, direction: direction_symbol }
  end
  
  def as_coordinates
    begin
      Polylines::Decoder.decode_polyline(coordinates)
    rescue
      []
    end
  end
  
  def as_coordinates_inverted_axis
    as_coordinates.map { |coordinate| [coordinate.last, coordinate.first] }
  end
  
  private 
  def hash_components
    as_coordinates.map { |coordinate| { latitude: coordinate.first, longitude: coordinate.last } }
  end

end