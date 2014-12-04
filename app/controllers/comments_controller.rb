class CommentsController < ApplicationController
	before_filter :load_commentable

	def index
		@comments = @commentable.comments
	end


	def new
		@comment = @commentable.comments.new
	end

	def create 
		@comment = @commentable.comments.create(comment_params)
		current_user.comments << @comment if current_user
		if @comment.save
			 redirect_to request.referrer, notice: "comment created"
		else
			render :new
		end
	end

	private 

	def comment_params
		params.require(:comment).permit(:content)
	end

	def load_commentable 
		resource, id = request.path.split('/')[1, 2]
		@commentable = resource.singularize.classify.constantize.find(id)
		@commentable 
	end


end