class AddUserToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :user_id, :integer
    add_index :reminders, :user_id
  end
end
