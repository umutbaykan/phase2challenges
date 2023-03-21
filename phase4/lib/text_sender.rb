require 'twilio-ruby'

class OrderSender
  def message(order_message)
    raise ArgumentError unless order_message.is_a? String != true
    account_sid = ENV["TWILIO_SID"]
    auth_token = ENV["TWILIO_AUTH"]
    twilio_sender = ENV["TWILIO_SENDER"]
    twilio_receiver = ENV["TWILIO_RECEIVER"]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "#{order_message}",
        to: "#{twilio_receiver}",
        from: "#{twilio_sender}")  

    # puts message.sid
  end
end

