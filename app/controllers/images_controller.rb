class ImagesController < ApplicationController
	before_filter :load_imageable

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


	private 

	def image_params
		params.require(:image).permit(:image_url)
	end

	def load_imageable
		resource, id = request.path.split('/')[1, 2]
		@imageable = resource.singularize.classify.constantize.find(id)
		p @imageable 
		p "****" * 20
		@imageable
	end

end