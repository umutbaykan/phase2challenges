# require 'text_sender'

# describe OrderSender do
#   it "sends a message to the user with the total price and estimated date" do
#     order_message = "Your basket with a total cost of £9 will be delivered by 18:30"
#     message_sender = OrderSender.new
#     expect(message_sender.message).to eq "Message successfully sent!"
#   end

#   it "fails to send a message if order information is not passed in" do
#     message_sender = OrderSender.new
#     expect{message_sender.message}.to raise_error "No message!"
#   end

# end