# frozen_string_literal: true

class RenameUsernameColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fullname, :string, null: false, default: ''
  end
end
