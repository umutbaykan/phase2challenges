require 'text_sender'

describe OrderSender do
  order_message = "Your basket with a total cost of £9 will be delivered by 18:30"

  ## this is the test that sends an actual message. xit it unless you want to spend credits
  it "sends a message to the user with the total price and estimated date" do
    message_sender = OrderSender.new
    expect(message_sender.message(order_message)).to eq "Message successfully sent!"
  end
  ##
  it "sends a return message using a mock double" do
    fake_client = double(:fake_client)
    params = {body: "#{order_message}", to: ENV["TWILIO_RECEIVER"], from: ENV["TWILIO_SENDER"]}
    allow(fake_client).to receive_message_chain(:messages, :create).with(params).and_return("Object verifier")
    message_sender = OrderSender.new(fake_client)
    expect(message_sender.message(order_message)).to eq "Message successfully sent!"
    expect(fake_client.messages.create(params)).to eq "Object verifier"
  end

  it "fails to send a message if order information is not passed in" do
    message_sender = OrderSender.new
    expect{message_sender.message}.to raise_error(ArgumentError)
  end
end