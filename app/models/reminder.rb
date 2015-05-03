class Reminder < ActiveRecord::Base
  
  date_time_attribute :send_time

  scope :messages_to_send, -> { where('send_time > ? AND send_time <= ?', Time.now, Time.now + 2.minutes) }

  belongs_to :user  

end