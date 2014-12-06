class RecipeStoriesController < ApplicationController
	before_filter :load_recipe 

	def index
	end

	def new
		# @new_user = @group_id.users.new
	end

	def create
		# if User.find_by(group_user_params)
		# 	@user = User.find_by(group_user_params)
		# else
		# 	redirect_to request.referrer, notice: "user not found"
		# end
		# @group_id.users << @user
		# if @group_id.save 
		# 	redirect_to request.referrer, notice: "user added"
		# else
		# 	render :root
		# end
	end

	def destroy
	end

	private 

	# def group_user_params
	# 	params.require(:group_user).permit(:email)
	# end

	def load_recipe 
		resource, id = request.referrer.split('/')[3, 4]
		@recipe_id = Recipe.find(id)
	end

end
