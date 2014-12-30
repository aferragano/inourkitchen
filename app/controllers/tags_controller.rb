class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]
  before_action :load_tagged, only: [:destroy]

	def index
	end

	def new
		@tag = Tag.new 
	end

	def create
	end

	def show
		@recipes = @tag.recipes
		
	end

	def edit
	end

	def update
	end

	def destroy
		@tag.recipe.find_by_id(@tagged)
	end

	private

	def set_tag
		@tag = Tag.find(params[:id])
	end

	def load_tagged
		resource, id = request.path.split('/')[1, 2]
		@tagged = resource.singularize.classify.constantize.find(id)
		@tagged
	end

end