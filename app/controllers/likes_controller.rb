# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.likes.build(like_params)
    @post = @like.post
    if @like.save
      Notification.create(recipient_id: @post.user_id, actor_id: current_user.id, action: 'like', notifiable: @like)
      respond_to :js
    end
  end

  def destroy
    @like = Like.find_by(id: params[:id])
    @post = @like.post
    @notification = Notification.find_by(notifiable_id: params[:id])
    if @like.destroy
      @notification.destroy
      respond_to :js
    end
  end

  private

  def like_params
    params.permit(:post_id)
  end
end
