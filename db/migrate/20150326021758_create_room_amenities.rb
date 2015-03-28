class CreateRoomAmenities < ActiveRecord::Migration
  def change
    create_table :room_amenities, :id => false do |t|
      t.timestamps null: false
      t.references :room, :amenity
    end

    add_index :room_amenities, [:room_id, :amenity_id]
  end
end