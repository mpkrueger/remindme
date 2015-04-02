require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(2.minutes, 'Sending reminder messages') { Reminder.each { |reminder| SmsSender.new(reminder).send_sms } }