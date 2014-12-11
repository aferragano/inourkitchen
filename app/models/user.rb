class User < ActiveRecord::Base
	has_many :images, :as => :imageable
	mount_uploader :image_url, ImageUploader
	has_many :recipes
	has_many :comments
	has_many :stories
	
	has_many :group_users
	has_many :groups, through: :group_users

	has_secure_password
end
