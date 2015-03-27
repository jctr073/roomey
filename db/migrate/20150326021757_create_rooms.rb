class CreateRooms < ActiveRecord::Migration
  def change
    create_table :rooms do |t|
      t.string :short_desc
      t.string :neighborhood
      t.decimal :price, precision: 10, scale: 2
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :rooms, :users
  end
end
