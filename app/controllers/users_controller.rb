class UsersController < ApplicationController


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
			render :new
		end
	end



	def destroy
		@user.destroy
	end

	private

	def user_params
		params.require(:user).permit(:username, :first_name, :last_name, :password, :password_confirmation, :email)
	end

end