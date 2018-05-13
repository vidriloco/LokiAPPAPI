class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string      :name
      t.string      :description
      t.integer     :authority_id
      t.text        :geojson_data
      t.boolean     :is_active, default: true
      t.timestamps
    end
  end
end
