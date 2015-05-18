require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(30.minutes, 'Sending reminder messages') { Reminder.messages_to_send.each { |reminder| SmsSender.new(reminder, reminder.user).send_sms } }