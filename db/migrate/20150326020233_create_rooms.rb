class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :neighborhood
      t.decimal :price, precision: 10, scale: 2
      t.text :description

      t.timestamps null: false
    end
  end
end
