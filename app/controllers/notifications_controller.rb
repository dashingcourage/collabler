# frozen_string_literal: true

class NotificationsController < ApplicationController
  def index
    @notifications = Notification.where(recipient_id: current_user.id).unread
  end
end
