class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|
      t.st_point   :coordinates, :geographic => true
      t.integer :user_id
      t.integer :vehicle_id
      t.integer :route_id

      t.timestamps
    end
  end
end
