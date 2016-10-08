class User < ApplicationRecord
  geocoded_by :current_location
  after_validation :geocode, :if => :current_location_changed?
end
