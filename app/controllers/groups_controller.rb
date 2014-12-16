class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

	def index
		@group = Group.new
		@groups = User.find_by_id(session[:user_id]).groups
	end

	def new
		@group = Group.new
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
		@group_user = @group.users.new
	end

	def edit
		@user = User.new
	end

	def update
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

	def new_user_params
		params.require(@group_user).permit(:email)
	end

end