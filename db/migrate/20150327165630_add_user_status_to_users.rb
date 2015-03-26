class AddUserStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :user_status, :integer, default: 1
  end
end
