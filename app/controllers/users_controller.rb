class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit]

	def index
		@user = User.new
	end

	def new
		@user = User.new
	end

	def create
		@user = User.create(user_params)
		if @user.save
			session[:user_id] = @user.id 
			redirect_to root_path
		else
			flash[:alert] = @user.errors.full_messages
			redirect_to root_path
		end
	end

	def show
		@recipes =@user.recipes
		@groups = @user.groups
		@user_image = @user.images
	end

	def destroy
		@user.destroy
	end

	def edit
		@imageable = @user
		@image = Image.new
		@images = @user.images
	end

	def update
	end

	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation, :email)
	end

	def set_user
		@user = User.find(params[:id])
	end

end