class AddSendToToReminders < ActiveRecord::Migration
  def change
    add_column :reminders, :send_time, :datetime
  end
end
