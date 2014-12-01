class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]
	def index
		@group = Group.new
		@groups = Group.all
	end

	def new
		# @group = Group.new
	end

	def create
		@group = Group.create(group_params)
		if @group.save
			redirect_to @group
		else
			render :new
		end
	end

	def show
	end

	def edit
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

end