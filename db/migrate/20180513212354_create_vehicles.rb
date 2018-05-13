class CreateVehicles < ActiveRecord::Migration[5.2]
  def change
    create_table :vehicles do |t|
      t.string :identifier
      t.integer :route_id

      t.timestamps
    end
  end
end
