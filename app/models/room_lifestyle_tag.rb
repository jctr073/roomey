class RoomLifestyleTag < ActiveRecord::Base
  belongs_to :room
  belongs_to :lifestyle_tag
end
