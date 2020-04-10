class RelationshipsController < ApplicationController
  def follow
    @user = User.find_by(id: params[:id])
    current_user.follow(params[:id])
    respond_to :js
  end

  def unfollow
    @user = User.find_by(id: params[:id])
    current_user.unfollow(params[:id])
    respond_to :js
  end
end
