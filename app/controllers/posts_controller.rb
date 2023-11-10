class PostsController < ApplicationController
  layout 'standard'

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)

    if @posts.any?
      @posts = @posts.paginate(page: params[:page], per_page: 2)
    else
      flash[:notice] = 'No posts found for this user.'
      redirect_to user_path(@user)
    end
  end

  def show
    @post = Post.find(params[:id])
  end
end
