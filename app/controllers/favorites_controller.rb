class FavoritesController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    favorite = current_user.favorites.build(post: post)
    authorize favorite

    if favorite.save
      flash[:notice] = "You have succesfully favorited this post"
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error trying to favorite this post. Please try again."
      redirect_to [post]
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = Favorite.find(params[:id])
    authorize favorite

    if favorite.destroy
      flash[:notice] = "You have successfully unfavorited this post."
      redirect_to [post.topic, post]
    else
      flash[:error] = "There was an error while unfavortiting this post. Please try again."
      redirect_to [post.topic, post]
    end
  end
end