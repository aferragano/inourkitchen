class Recipe < ActiveRecord::Base
	belongs_to :user
	mount_uploader :image_url, ImageUploader

	has_many :comments, :as => :commentable
	has_many :images, :as => :imageable

	has_many :group_recipes
	has_many :groups, through: :group_recipes

	has_many :recipe_stories
	has_many :stories, through: :recipe_stories

	has_many :recipe_tags
	has_many :tags, through: :recipe_tags

end
