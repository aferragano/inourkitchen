class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

	def index
	end

	def new
		@recipe = Recipe.new
	end

	def create
		@recipe = Recipe.create(recipe_params)
		if @recipe.save
			redirect_to @recipe
		else
			render :new
		end
	end

	def show
	end

	private

	def recipe_params
		params.require(:recipe).permit(:title, :summary, :serve_size, :time, :ingredients, :directions)
	end

	def set_recipe
		@recipe = Recipe.find(params[:id])
	end
end