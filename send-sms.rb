require 'twilio-ruby'


client = Twilio::REST::Client.new account_sid, auth_token

from = "+14159806288"

friends = {
  "+17085574423" => "mia pinguino",
  "+16508159753" => "Matt Krueger"
}

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, this is a test text from your husband. I love you!",
    :media_url => "http://www.glamour.com/images/entertainment/2013/11/penguins-5-main.jpg"
  )
  puts "Sent message to #{value}"
end