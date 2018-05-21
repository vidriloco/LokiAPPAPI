class Route < ApplicationRecord
  has_many :vehicles
  has_many :positions
  has_many :users, through: 'tracking_allowances'
  
  belongs_to :authority
  
  def coordinates_list
     eval(geojson_data.gsub("\n", "").gsub("\t", "").match(/(\[([\[[-\d., ]*\], ])*)/).to_s)
  end
  
  def authority_name
    authority.name
  end
end
