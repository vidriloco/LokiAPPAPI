class CreatePaths < ActiveRecord::Migration[5.2]
  def change
    create_table :paths do |t|
      t.string :coordinates
      t.integer :direction, default: 0
      t.integer :route_id
      
      t.timestamps
    end
  end
end
