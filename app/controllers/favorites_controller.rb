class FavoritesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    if Favorite.create(user_id: current_user.id, post_id: @post.id)
      @post.create_notification_favorite!(current_user)
      respond_to :js
    else
      redirect_to root_path
    end
  end

  def destroy
    @post = Post.find_by(id: params[:post_id])
    if favorite = Favorite.find_by(user_id: current_user.id, post_id: @post.id)
      favorite.delete
      respond_to :js
    else
      redirect_to root_path
    end
  end

  def index
    @favorites = current_user.fav_posts
  end
end
