class CreateTrackingAllowances < ActiveRecord::Migration[5.2]
  def change
    create_table :tracking_allowances do |t|
      t.integer :user_id
      t.integer :route_id
      t.boolean :allowed_to_track

      t.timestamps
    end
    
    add_index :tracking_allowances, [:user_id, :route_id], unique: true
  end
end
