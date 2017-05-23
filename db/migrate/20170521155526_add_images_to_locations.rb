class AddImagesToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :images, :string, array: true, default: []
  end
end
