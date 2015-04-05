class LifestyleTag < ActiveRecord::Base
	has_many :room_lifestyle_tags
	has_many :lifestyle_tags, :through => :room_lifestyle_tags
end
