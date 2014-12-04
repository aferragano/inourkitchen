class GroupRecipesController < ApplicationController
before_filter :load_group 

	def index
	end

	def new
		@new_recipe = @group_id.recipes.new
	end

	def create
		if User.find_by(group_user_params)
			@user = User.find_by(group_user_params)
		else
			redirect_to request.referrer, notice: "user not found"
		end
		@group_id.users << @user
		if @group_id.save 
			redirect_to request.referrer, notice: "user added"
		else
			render :root
		end
	end

	def destroy
	end

	private 

	def group_recipe_params
	end

	def load_group 
		resource, id = request.referrer.split('/')[3, 4]
		@group_id = Group.find(id)
	end

end

end
