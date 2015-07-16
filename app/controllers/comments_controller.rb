class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(comment_params)
     @comment.post_id = @post.id
     @topic = Topic.find(params[:topic_id])
     authorize @comment
     
     if @comment.save
      flash[:notice] = "Comment was saved."
     else
      flash[:error] = "There was an error saving the comment. Please try again."
     end
     redirect_to [@topic, @post]
  end

  def new
    authorize @comment
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
