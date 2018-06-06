class Path < ApplicationRecord
  belongs_to :route
    
  def self.direction_names
    ["Inbound", "Outbound", "Both"]
  end
  
  def direction_name=(value)
    self.direction = Path.direction_names.index(value)
  end
  
  def direction_name
    Path.direction_names[direction]
  end
  
  def as_coordinates
    Polylines::Decoder.decode_polyline(coordinates)
  end
  
  def as_coordinates_inverted_axis
    as_coordinates.map { |coordinate| [coordinate.last, coordinate.first] }
  end

end
