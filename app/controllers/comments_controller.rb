class CommentsController < ApplicationController
  def new
    @user = User.where(email: session[:user_email]).first
    @comment = @user.posts[params[:post_id].to_i - 1].comments.new
  end

  def create
    @comment = Comment.create(text: params[:comment][:text], user: current_user, post_id: params[:post_id])
    if @comment.new_record?
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                  flash: { wrong: 'Upps! Comment was not created.' }
    else
      redirect_to "/users/#{params[:user_id]}/posts/#{params[:comment][:url_id]}",
                  flash: { success: 'Comment was successfully created.' }
    end
  end
end
