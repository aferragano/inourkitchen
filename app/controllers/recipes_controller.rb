class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

	def index
		@q = Recipe.new
		

		@recipes = Recipe.all 
		if session[:user_id]
			@groups = User.find_by_id(session[:user_id]).groups
			@user_recipes = User.find_by_id(session[:user_id]).recipes
		end
	end


 
	def new
		@recipe = Recipe.new
	end
 
	def create
		@recipe = Recipe.create(recipe_params)
		@user = User.find_by_id(session[:user_id])
		@user.recipes << @recipe 
		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
	end

	def show
		@r_comments = @recipe.comments
		@commentable = @recipe
		@groups = @recipe.groups
		@stories = @recipe.stories
		@comment = Comment.new
		@tags = @recipe.tags

	end

	def update
		if @recipe.update(recipe_params)
			redirect_to @recipe
		else
			render :edit
		end
	end

	def destroy
		@recipe.destroy
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :summary, :serve_size, :time, :ingredients, :directions)
	end

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end

	def q_recipe_params
		params.require(:recipe).permit(:title)
	end
end