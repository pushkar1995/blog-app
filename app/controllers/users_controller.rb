class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id].to_i)
  end

  def logout
    reset_session
    redirect_to new_user_session_path, notice: 'Logged out successfully.'
  end
end
