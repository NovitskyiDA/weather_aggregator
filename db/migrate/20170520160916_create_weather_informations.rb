class CreateWeatherInformations < ActiveRecord::Migration[5.0]
  def change
    create_table :weather_informations do |t|
      t.integer :location_id
      t.string :description
      t.string :icon
      t.integer :current_temp
      t.integer :temp_max
      t.integer :temp_min
      t.integer :humidity
      t.integer :pressure
      t.decimal :wind_speed
      t.integer :wind_degree
      t.timestamps
    end
  end
end
