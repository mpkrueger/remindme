class Reminder < ActiveRecord::Base
  scope :messages_to_send, -> { where(send_time <= (Time.zone.now + 2.minutes)) }
end
