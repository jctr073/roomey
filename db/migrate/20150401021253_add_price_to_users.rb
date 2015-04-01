class AddPriceToUsers < ActiveRecord::Migration
  def change     
    add_column :users, :price, :decimal, precision: 10, scale: 2
  end
end
