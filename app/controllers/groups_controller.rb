class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
	def index
		@group = Group.new
		@groups = User.find_by_id(session[:user_id]).groups
	end

	def new
		
	end

	def create
		@group = Group.create(group_params)
		@group.users << User.find_by_id(session[:user_id])
		if @group.save
			redirect_to @group
		else
			render :new
		end
	end

	def show
		@recipes = @group.recipes
		@g_users = @group.users
		# group_users = @group.group_users.new
		@group_user = @group.users.new
	end

	def edit
		@user = User.new
	end

	def update
		# @group.users << User.create(user_params)
		# if @group.users.save
		# 	redirect_to request.referrer
		# else
		# 	render :edit
		# end
	end

	def destroy
	end
	
	private

	def set_group
		@group = Group.find(params[:id])
	end

	def group_params
		params.require(:group).permit(:name)
	end

	# def user_params
	# 	params.require(:user).permit(:email)
	# end

	def new_user_params
		params.require(@group_user).permit(:email)
	end

end