# frozen_string_literal: true

class AddColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string, null: false, default: ''
    add_column :users, :website, :string
    add_column :users, :introduction, :string
    add_column :users, :phone, :string
    add_column :users, :sex, :integer
  end
end
