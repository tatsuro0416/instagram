# frozen_string_literal: true

class AddColumnToNotification < ActiveRecord::Migration[5.2]
  def change
    # add_column :notifications, :visitor_id, :integer
    # add_column :notifications, :visited_id, :integer
    add_column :notifications, :post_id, :integer
    add_column :notifications, :comment_id, :integer
    add_column :notifications, :action, :string, default: '', null: false
    add_column :notifications, :boolean, :string, default: false, null: false

    # add_index :notifications, :visitor_id
    # add_index :notifications, :visited_id
    add_index :notifications, :post_id
    add_index :notifications, :comment_id
  end
end
