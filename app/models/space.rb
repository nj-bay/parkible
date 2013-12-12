class Space < ActiveRecord::Base
	validates :address, :price, :user, :presence => true

	belongs_to :user
	
end
