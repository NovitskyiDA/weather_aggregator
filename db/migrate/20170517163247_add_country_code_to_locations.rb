class AddCountryCodeToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :country_code, :string
  end
end
