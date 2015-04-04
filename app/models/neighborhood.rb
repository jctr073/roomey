class Neighborhood < ActiveRecord::Base
  has_many :room
  has_many :user
end