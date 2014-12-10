class GroupRecipesController < ApplicationController
before_filter :load_recipe 

	def index
	end

	def new
 
	end

	def create
		if Group.find_by( group_recipe_params)
			@group = Group.find_by(group_recipe_params)
		else
			redirect_to request.referrer, notice: "user not found"
		end
		@group.recipes << @recipe 
		if @group.save 
			redirect_to request.referrer
		else
			render :root
		end
	end

	def destroy
	end

	private 

	def group_recipe_params
		params.require(:group_recipe).permit(:name)
	end

	def load_recipe 
		resource, id = request.referrer.split('/')[3, 4]
		@recipe = Recipe.find(id)
	end

end
