require 'test_helper'

class EmailControllerTest < ActionDispatch::IntegrationTest
 
   test "send email method" do
     params = { "to": "fake@example.com", "to_name": "Mr. Fake", "from": "noreply@gmail.com", "from_name": "Brightwheel", "subject": "A message from brightwheel", "body": "<h1>Youer Bill</h1><p>$10</p>" }
     email = Email.new(params)
    
     mock = Minitest::Mock.new
     mock.expect :send_email, true, [email]
     MailerService.stub(:new, mock) do
      response = post '/email', params: params, as: :json
     end
     
     assert_mock mock
     assert mock.verify
    
     assert_equal 201, status
   end
 
end
