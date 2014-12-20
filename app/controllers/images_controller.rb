class ImagesController < ApplicationController
	before_filter :load_imageable, except: :destroy

	def index 
		@images = @imageable.images 
	end

	def new
		@image = @imageable.images.new
	end

	def create
		@image = @imageable.images.create(image_params)
		if @image.save 
			redirect_to request.referrer, notice: "image added"
		else
			render :new
		end
	end

	def destroy
		image = Image.find(image_params_id) 
		image.destroy
		redirect_to request.referrer
	end


	private 

	def image_params_id
		params.require(:id)
	end

	def image_params
		params.require(:image).permit(:image_url)
	end

	def load_imageable
		resource, id = request.path.split('/')[1, 2]
		@imageable = resource.singularize.classify.constantize.find(id)
		@imageable
	end

end