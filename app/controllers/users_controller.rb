class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end

  def following
    @title = 'フォロー'
    @user = User.find_by(id: params[:id])
    render 'show_follow'
  end

  def followers
    @title = 'フォロワー'
    @user = User.find_by(id: params[:id])
    render 'show_follow'
  end

  def index
    @users = User.all
  end
end
