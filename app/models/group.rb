class Group < ActiveRecord::Base
	has_many :group_users
	has_many :users, through: :group_users
	has_many :group_recipes
	has_many :recipes, through: :group_recipes
end
