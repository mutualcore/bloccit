class CommentsController < ApplicationController
  def create
     @user = current_user
     @post = Post.find(params[:post_id])
     @comment = @post.comments.create(params[:body])
     @comment.save
     redirect_to [@post.topic, @post]
  end
end
