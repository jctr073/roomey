class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :interger
    add_column :users, :seeker, :boolean
    add_column :users, :gender, :string
  end
end
