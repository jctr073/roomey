class AddDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :age, :interger
    add_column :users, :seeker, :boolean default: false
    add_column :users, :gender, :string
  end
end
