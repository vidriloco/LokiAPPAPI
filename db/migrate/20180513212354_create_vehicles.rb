class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string    :identifier, unique: true
      t.integer   :route_id
      t.st_point  :coordinates, :geographic => true
      t.timestamps
    end
  end
end
