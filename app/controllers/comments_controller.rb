class CommentsController < ApplicationController
  def create
     @post = Post.find(params[:post_id])
     @comment = current_user.comments.build(comment_params)
     @comment.post_id = @post.id
     authorize @comment
     
     if @comment.save
      flash[:notice] = "Comment was saved."
     else
      flash[:error] = "There was an error saving the comment. Please try again."
     end
     redirect_to [@post.topic, @post]
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    authorize @comment
    if @comment.destroy
      flash[:notice] = "Comment was removed"
    else
      flash[:error] = "Comment couldn't be deleted, try again."
    end

    respond_to do |format|
      format.html
      format.js
    end
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
