class GroupUsersController < ApplicationController
  # before_action :set_group, only: [:show, :edit, :update, :destroy]
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

	# def group_params
	# 	params.require(:group).permit(:name)
	# end

	# def set_group
	# 	@group = Group.find(params[:id])
	# end

	def load_group 
		p request.referrer
		p request.path
		p "#" * 50
		p request.referrer.split('/')
		resource, id = request.referrer.split('/')[3, 4]
		p resource
		p id
		@group_id = Group.find(id)
		p @group_id.name 
	end

end
