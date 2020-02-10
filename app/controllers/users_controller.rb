# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:photos).order('created_at DESC')
  end

  def index
    @users = User.order('created_at DESC').page(params[:users_list]).per(5)
    @posts = Post.all.includes(:photos).order('created_at DESC').page(params[:posts_list]).per(9)
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      flash[:notice] = "パスワードが変更されました"
      redirect_to user_path(@user)
    else
      flash.now[:alert] = "変更に失敗しました"
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
