class RecipeStoriesController < ApplicationController
	before_filter :load_recipe 

	def index
	end

	def new
		# @new_user = @group_id.users.new
		@recipe_story = @recipe.stories.new
	end

	def create
		story = Story.create(recipe_story_params)
		@recipe.stories << story
		current_user.stories << story
		if @recipe.save
			redirect_to request.referrer
		else
			render :new
		end
	end

	def destroy
	end

	private 

	def recipe_story_params
		params.require(:recipe_story).permit(:title, :content)
	end

	def load_recipe 
		resource, id = request.referrer.split('/')[3, 4]
		@recipe = Recipe.find(id)
	end

end
