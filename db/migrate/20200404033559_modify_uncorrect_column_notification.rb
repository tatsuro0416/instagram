# frozen_string_literal: true

class ModifyUncorrectColumnNotification < ActiveRecord::Migration[5.2]
  def up
    add_column :notifications, :checked, :boolean, default: false, null: false
  end

  def down
    remove_column :notifications, :boolean, :string, default: false, null: false
  end
end
