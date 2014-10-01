class CommentsController < ApplicationController
	respond_to :json
	def create
		post = Post.find(params[:postId])
		comment = Comment.create({author: params[:author], comment: params[:comment], post: post})
		if comment.valid?
			comment.save
		else
			render 'public/442', :status => 442
			return
		end
		respond_with(comment) do |format|
      		format.json { render :json => comment.as_json }
    	end
	end
end
