class Route < ApplicationRecord
  belongs_to :authority
  
  def coordinates_list
     eval(geojson_data.gsub("\n", "").gsub("\t", "").match(/(\[([\[[-\d., ]*\], ])*)/).to_s)
  end
end
