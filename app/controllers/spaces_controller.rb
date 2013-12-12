class SpacesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def new
		@space = Space.new
		render :new
	end
	
	def create
		safe_space = params.require(:space).permit(:address, :price, :user_id)

		@space = Space.new( safe_space )
		@space.user = current_user

		if @space.save
			redirect_to root_path
		else
			render :new
		end		
	end		

	def show
		@space = Space.find(params[:id])
		render :new
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
