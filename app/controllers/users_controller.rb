class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:photos).order('created_at DESC')
  end

  def index
    @feed_items = current_user.feed.includes(:photos).order('created_at DESC')
  end
end
