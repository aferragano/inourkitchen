class UsersController < ApplicationController
	
def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.user.id 
			redirect_to root_path
		else
			flash[:alert] = @user.erros.full_messages
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