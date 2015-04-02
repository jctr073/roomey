class AddDreamPlaceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :neighbor_id, :interger
  end
end
