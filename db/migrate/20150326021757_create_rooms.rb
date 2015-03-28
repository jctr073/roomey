class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :short_desc
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.integer :size
      t.references :user, index: true
      t.references :neighborhood, index: true

      t.timestamps null: false
    end
    add_foreign_key :rooms, :users
    add_foreign_key :rooms, :neighborhoods
  end
end
