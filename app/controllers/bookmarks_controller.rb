# frozen_string_literal: true

class BookmarksController < ApplicationController
  before_action :authenticate_user!

  def create
    @bookmark = current_user.bookmarks.build(bookmark_params)
    @post = @bookmark.post
    respond_to :js if @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find_by(id: params[:id])
    @post = @bookmark.post
    respond_to :js if @bookmark.destroy
  end

  private

  def bookmark_params
    params.permit(:post_id)
  end
end
