class Recipe < ActiveRecord::Base
	has_many :group_recipes
	has_many :groups, through: :group_recipes
end
