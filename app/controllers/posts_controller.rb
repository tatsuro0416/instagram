class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show destroy]

  def new
    @post = Post.new
    @post.photos.build
  end

  def create
    @post = Post.new(post_params)
    if @post.photos.present?
      @post.save!
      redirect_to post_path(@post)
      flash[:notice] = '投稿が保存されました。'
    else
      redirect_to root_path
      flash[:alert] = '投稿に失敗しました。'
    end
  end

  def index
    @posts = []
    current_user_posts = Post.where(user_id: current_user.id)
    following_users = current_user.following_user
    if following_users.present?
      following_users.each do |following_user|
      following_user_posts = Post.where(user_id: following_user.id)
      @posts.concat(following_user_posts)
      end
    end
    @posts.concat(current_user_posts).uniq!
    @posts.sort_by!(&:created_at).reverse!
  end

  def show
    @post = set_post
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    if @post.destroy
      flash[:notice] = '投稿を削除しました' 
    else
      flash[:alert] = '投稿の削除に失敗しました'
    end
    redirect_to root_path
  end

  def search
    @posts = Post.search(params[:search]).order('created_at DESC')
    render 'posts/index'
  end

  private

  def post_params
    params.require(:post).permit(:caption, photos_attributes: [:image]).merge(user_id: current_user.id)
  end

  def set_post
    post = Post.find_by(id: params[:id])
  end
end
