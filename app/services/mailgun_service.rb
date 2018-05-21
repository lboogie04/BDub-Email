require 'net/http'
require 'json'
require 'uri'

KEY = ENV['MAILGUN_API_KEY']
URL = ENV['MAILGUN_URL']

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
  req.body = email.to_json
  
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
 
end