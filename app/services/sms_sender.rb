# Twilio | SmsSender | Your app

class SmsSender
  # attr_reader :client
  require 'twilio-ruby'

  def initialize(reminder)
    @from = "+14159806288"
    @phone = "+16508159753"
    @name = "Matt"
    @message = reminder.message
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_sms
    @client.account.messages.create(
      from: @from,
      to: @phone,
      body: @message
    )
    puts "Send message to #{@name}"
  end
end



# Reminder.messages_to_send_within_2_minutes.each { |reminder| SmsSender.new(reminder).send_sms }