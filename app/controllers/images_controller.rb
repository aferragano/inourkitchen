require 'digest/sha1'
class ImagesController < ApplicationController
	before_filter :load_imageable, except: :destroy

	def index 
		@images = @imageable.images 
	end

	def new
		@image = @imageable.images.new
		if unsigned_mode?
      @unsigned = true
      # make sure we have the appropriate preset
      @preset_name = "sample_" + Digest::SHA1.hexdigest(Cloudinary.config.api_key + Cloudinary.config.api_secret)
      begin
        preset = Cloudinary::Api.upload_preset(@preset_name)
        if !preset["settings"]["return_delete_token"]
          Cloudinary::Api.update_upload_preset(@preset_name, :return_delete_token=>true)
        end
      rescue
        # An upload preset may contain (almost) all parameters that are used in upload. The following is just for illustration purposes
        Cloudinary::Api.create_upload_preset(:name => @preset_name, :unsigned => true, :folder => "preset_folder", :return_delete_token=>true)
      end
    end
    render view_for_new
	end

	def create
		@image = @imageable.images.create(image_params)
		p "* " * 100

		p @image 

		if @image.save 
			redirect_to request.referrer, notice: "image added"
			# @image.update_attributes(:bytes => @image.image_url.metadata['bytes'])
      # Show upload metadata in the view
      @upload = @image.image_url.metadata
		else
			render :new
		end
	end

	def destroy
		image = Image.find(image_params_id) 
		image.destroy
		redirect_to request.referrer
	end

  protected
  
  def direct_upload_mode?
    params[:direct].present?
  end
  
  def unsigned_mode?
    params[:unsigned].present?
  end
  
  def view_for_new
    direct_upload_mode? ? "new_direct" : "new"
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