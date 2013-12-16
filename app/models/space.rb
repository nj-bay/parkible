class Space < ActiveRecord::Base
	validates :address, :price, :user, :latitude, :longitude, :presence => true
	geocoded_by :address
	 mount_uploader :image, ImageUploader

	belongs_to :user 

	before_save :dollarize

	private

	def dollarize
		price.round(2)
		
	end
	
end
