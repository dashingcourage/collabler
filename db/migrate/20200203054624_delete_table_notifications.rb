# frozen_string_literal: true

class DeleteTableNotifications < ActiveRecord::Migration[5.2]
  def change
    drop_table :notifications
  end
end
