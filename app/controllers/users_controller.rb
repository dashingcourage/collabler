# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.includes(:photos).order('created_at DESC')
  end

  def index
    @users = User.all.order('created_at DESC')
    @posts = Post.all.includes(:photos).order('created_at DESC')
  end

  def edit
    @user = current_user
  end

  def update_password
    @user = current_user
    if @user.update_with_password(user_params)
      bypass_sign_in(@user)
      redirect_to root_path
    else
      flash[:alert] = '内容に誤りがあります。'
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
