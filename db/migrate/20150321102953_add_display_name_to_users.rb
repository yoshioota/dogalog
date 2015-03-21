class AddDisplayNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :display_name, :string, after: 'id'
  end
end
