require 'net/http'
require 'json'
require 'uri'

KEY = ENV['SENDGRID_API_KEY']
URL = ENV['SEND_GRID_URL']

class MailGunService
 
 
 def initialize(key=KEY, url=URL)
  @key = key
  @url = url
 end
 
 def send_email(email)
  req_uri = URI.parse(@url)
  req = Net::HTTP::Post.new(req_uri)
  req['Content-type'] = 'application/json'
  req['Accept'] = 'application/json'
  req["Authorization"] = "Bearer #{@key}"
  req.body = email_json
  
  res = Net::HTTP.start(req_uri.hostname, req_uri.port, { use_ssl: true }) do |http|
    http.request(req) do |resp|
      if resp.code == "201"
        puts "Email sent."
        email = JSON.parse(resp.body)
      else
        puts "Email failed. #{resp.code}"
      end
    end
  end
  
 end
 
 
 private
 
 def email_json
  {
			  "personalizations": [
			    {
			      "to": [
			        {
			          "email": "#{email.to}"
			        }
			      ],
			      "subject": "#{email.subject}"
			    }
			  ],
			  "from": {
			    "email": "#{email.from}"
			  },
			  "content": [
			    {
			      "type": "text/plain",
			      "value": "#{email.text}"
			    }
			  ]
			}.to_json
  
 end
 
end