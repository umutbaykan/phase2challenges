require 'twilio-ruby'

class OrderSender
  def initialize(client)
    @client = client
  end

  def message(order_message=nil)
    raise ArgumentError unless order_message
    twilio_sender = ENV["TWILIO_SENDER"]
    twilio_receiver = ENV["TWILIO_RECEIVER"]
    message = @client.messages.create(
        body: "#{order_message}",
        to: "#{twilio_receiver}",
        from: "#{twilio_sender}")  
    return "Message successfully sent!" if message
  end
end