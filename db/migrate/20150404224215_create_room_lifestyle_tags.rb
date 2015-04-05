class CreateRoomLifestyleTags < ActiveRecord::Migration
  def change
    create_table :room_lifestyle_tags do |t|
      t.references :room, index: true
      t.references :lifestyle_tag, index: true

      t.timestamps null: false
    end
    add_foreign_key :room_lifestyle_tags, :rooms
    add_foreign_key :room_lifestyle_tags, :lifestyle_tags
  end
end
