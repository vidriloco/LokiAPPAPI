class AddMissingKeysToMigrations < ActiveRecord::Migration[5.2]
  def change
    add_index :vehicles, [:route_id, :identifier], unique: true
    add_index :tracking_allowances, [:user_id, :route_id], unique: true
  end
end
