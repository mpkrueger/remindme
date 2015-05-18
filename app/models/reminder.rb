class Reminder < ActiveRecord::Base
  
  date_time_attribute :send_time

  scope :messages_to_send, -> { where('send_time > ? AND send_time <= ?', Time.now, Time.now + 30.minutes) }

  belongs_to :user

  validates :message, presence: true, length: { maximum: 135 }
  validates :send_time, presence: true

end