class TagsController < ApplicationController
  before_action :set_tag, only: [:show, :edit, :update, :destroy]

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
		
	end

	private

	def set_tag
		@tag = Tag.find(params[:id])
	end

end