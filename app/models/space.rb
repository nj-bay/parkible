class Space < ActiveRecord::Base
	validates :address, :price, :user, :latitude, :longitude, :presence => true
	geocoded_by :address
	before_validation :geocode#, if => :address_changed?

	belongs_to :user
	
end
