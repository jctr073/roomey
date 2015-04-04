class AddDreamPlaceIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :neighborhood_id, :interger
  end
end
