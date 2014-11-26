class Story < ActiveRecord::Base
	belongs_to :user
	
	has_many :recipe_stories 
	# has_many :recipes, through: recipe_stories

	has_many :comments, :as => :commentable 
	has_many :images, :as => :imageable 

end
