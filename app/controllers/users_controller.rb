class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:photos).order('created_at DESC')
  end

  def index
    @feed_items = current_user.feed.includes(:photos).order('created_at DESC')
  end

  private

  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
