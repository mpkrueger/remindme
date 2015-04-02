class CreateReminders < ActiveRecord::Migration
  def change
    create_table :reminders do |t|
      t.text :message

      t.timestamps null: false
    end
  end
end
