class Room < ActiveRecord::Base
  belongs_to 	:user
  belongs_to 	:neighborhood
  has_many 		:room_amenities
  has_many		:amenities, :through => :room_amenities	
  default_scope -> { order(created_at: :desc) }

end