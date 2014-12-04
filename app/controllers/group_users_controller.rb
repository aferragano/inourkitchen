class GroupUsersController < ApplicationController
	before_filter :load_group 

	def index
	end

	def new
		@new_user = @group_id.users.new
	end

	def create
		@user = User.find_by(group_user_params)
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

	def group_user_params
		params.require(:group_user).permit(:email)
	end

	def load_group 
		resource, id = request.referrer.split('/')[3, 4]
		@group_id = Group.find(id)
	end

end
