class CreateJoinTableUserLocation < ActiveRecord::Migration[5.0]
  def change
    create_join_table :users, :locations do |t|
      t.index [:user_id, :location_id]
    end
  end
end
