require 'text_sender'

describe OrderSender do
  account_sid = ENV["TWILIO_SID"]
  auth_token = ENV["TWILIO_AUTH"]
  client = Twilio::REST::Client.new(account_sid, auth_token)
  order_message = "Your basket with a total cost of £9 will be delivered by 18:30"
  params = {body: "#{order_message}", to: ENV["TWILIO_RECEIVER"], from: ENV["TWILIO_SENDER"]}

  xit "sends a message to the user with the total price and estimated date" do
    message_sender = OrderSender.new(client)
    expect(message_sender.message(order_message)).to eq "Message successfully sent!"
  end

  it "sends a message to the user with the total price and estimated date with mock client" do
    mock_client = double(:mock_client)
    message_sender = OrderSender.new(mock_client)
    allow(mock_client).to receive_message_chain(:messages, :create).with(params).and_return("Object")
    expect(message_sender.message(order_message)).to eq "Message successfully sent!"
  end

  it "fails to send a message if order information is not passed in" do
    message_sender = OrderSender.new(client)
    expect{message_sender.message}.to raise_error(ArgumentError)
  end

end
