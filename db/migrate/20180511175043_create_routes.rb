class CreateRoutes < ActiveRecord::Migration[5.2]
  def change
    create_table :routes do |t|
      t.string      :name
      t.string      :description
      t.integer     :authority_id
      t.string      :image_url
      t.boolean     :is_active, default: true
      
      t.string      :color
      t.integer     :stroke
      
      t.timestamps
    end
  end
end
