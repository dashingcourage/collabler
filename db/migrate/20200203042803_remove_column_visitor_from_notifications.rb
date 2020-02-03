class RemoveColumnVisitorFromNotifications < ActiveRecord::Migration[5.2]
  def down
    remove_index :notifications, name: :index_notifications_on_visitor_id
  end
end
