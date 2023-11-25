class LikesController < ApplicationController
  def create
    @user = User.where(email: session[:user_email]).first
    @like = Like.create(user: @user, post_id: params[:post_item_id])
    if @like.new_record?
      puts 'Ups!can not like'
    else
      puts 'One more like'
    end
  end
end
