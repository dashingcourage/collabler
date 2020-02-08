# frozen_string_literal: true

class NotificationsController < ApplicationController
  before_action :authenticate_user!

  def index
    @notifications = Notification.where(recipient_id: current_user.id)
  end

end
