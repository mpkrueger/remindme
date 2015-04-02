class Reminder < ActiveRecord::Base
  scope :messages_to_send, -> { where('send_time > ? AND send_time <= ?', Time.now, Time.now + 2.minutes) }

  # NEED TO FIX THIS

end
