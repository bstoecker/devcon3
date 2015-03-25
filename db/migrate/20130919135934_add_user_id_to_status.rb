class AddUserIdToStatus < ActiveRecord::Migration
  def change
    add_column :status, :user_id, :integer
  end
end
