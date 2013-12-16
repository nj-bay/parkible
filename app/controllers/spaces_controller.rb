class SpacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@spaces = Space.all
		@hash = Gmaps4rails.build_markers(@spaces) do |space, marker|
		  marker.lat space.latitude
		  marker.lng space.longitude
		  marker.json({:id => space.id})
		  marker.infowindow render_to_string(:partial => "/spaces/infowindow", :locals => { :space => space})
		end
	end

	def new
		@space = Space.new
	end
	
	def create
		safe_space = params.require(:space).permit(:address, :price, :user_id)

		@space = Space.new( safe_space )
		@space.user = current_user

		if @space.save
			redirect_to space_path(@space)
		else
			render :new
		end		
	end	

	def list
		@space = Space.list
	end		

	def show
		@space = Space.find(params[:id])
	end 



	def update
		@space = Space.find(params[:id])
		@space.update_attributes(space_params)
		redirect_to root_path
	end	
	
	def edit
	end

	def destroy
	end	

private

def space_params
	params.require(:space).permit(:address, :price, :user_id)
end

end
