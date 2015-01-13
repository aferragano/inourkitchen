class RecipeTagsController < ApplicationController
	before_filter :load_recipe
	before_filter :load_recipe_tag, only: :destroy
	
	def index
	end

	def new
		@recipe_tag = @recipe.tags.new
	end

	def create
		tag = Tag.find_or_create_by(recipe_tags_params)
		@recipe.tags << tag
		if @recipe.save
			redirect_to request.referrer
		else
			render :new
		end

	end

	def destroy
		#need to edit this code so that delete only deletes the asscociation
		p"&" * 100
		p @recipe.tags
		p "boop"
		@recipe_tag.delete
		redirect_to request.referrer
	end

	private 

	def recipe_tags_params
		params.require(:recipe_tag).permit(:name)
	end

	def load_recipe 
		resource, id = request.referrer.split('/')[3, 4]
		@recipe = Recipe.find(id)
	end

	def load_recipe_tag
		@recipe_tag = RecipeTag.find(params[:id])
	end

end