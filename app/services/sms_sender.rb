# Twilio | SmsSender | Your app

class SmsSender
  attr_reader :client
  def initialize(user, reminder)
    @from = "+14259806288"
    @phone = user.phone
    @name = user.name
    @message = reminder.message(@name)
    @client = Twilio::REST::Client.new twilio_account_sid, twilio_auth_token
  end

  def send_sms
    client.account.messages.create(
      from: @from,
      to: @phone,
      body: @message
    )
  end
end



# Reminder.messages_to_send_within_2_minutes.each { |reminder| SmsSender.new(reminder).send_sms }