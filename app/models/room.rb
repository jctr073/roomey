class Room < ActiveRecord::Base
  belongs_to 	:user
  belongs_to 	:neighborhood
  has_many 		:room_amenities
  has_many		:amenities, :through => :room_amenities	
  has_many 		:room_lifestyle_tags
	has_many 		:lifestyle_tags, :through => :room_lifestyle_tags
  default_scope -> { order(created_at: :desc) }
  scope :neighborhood, -> (neighborhood) { where neighborhood: neighborhood }
  scope :max_price, -> (max_price) { where("price <= ?", max_price) }
  scope :contains, -> (search_string) { where("description like ? or short_desc like ?", "%#{search_string}%", "%#{search_string}%")}
end