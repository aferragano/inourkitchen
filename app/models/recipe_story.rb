class RecipeStory < ActiveRecord::Base
	belongs_to :recipe 
	belongs_to :story 
end
