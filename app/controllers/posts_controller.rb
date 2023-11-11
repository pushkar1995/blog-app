class PostsController < ApplicationController
  before_action :find_post, only: [:show]
  before_action :initialize_like

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    puts 'i am here pushkar'
    @user = User.find(params[:user_id])
    @post = Post.create(author: @user, title: params[:post][:title], text: params[:post][:text], comments_counter: 0,
                        likes_counter: 0)
    if @post.save
      redirect_to user_posts_path(@user)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def initialize_like
    @like = Like.new
  end
end
