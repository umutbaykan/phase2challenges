require 'twilio-ruby'

class OrderSender
  def initialize(twilio_server=(Twilio::REST::Client.new(ENV["TWILIO_SID"], ENV["TWILIO_AUTH"])))
    @twilio_server = twilio_server
  end

  def message(order_message)
    raise ArgumentError unless order_message
    twilio_sender = ENV["TWILIO_SENDER"]
    twilio_receiver = ENV["TWILIO_RECEIVER"]
    message = @twilio_server.messages.create(
        body: "#{order_message}",
        to: "#{twilio_receiver}",
        from: "#{twilio_sender}")  
    return "Message successfully sent!" if message
    # puts message.sid
  end

  def whoami
    return @twilio_server
  end

end
