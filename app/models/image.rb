class Image < ActiveRecord::Base
	belongs_to :imagable, :polymorphic => true
	mount_uploader :image_url, ImageUploader
end
