class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:photos, :likes, :comments)
  end
end
