class GroupRecipe < ActiveRecord::Base
	belongs_to :group 
	belongs_to :recipe
end
