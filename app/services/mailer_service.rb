class MailerService
 
 def initialize
  mailgun = MailGunService.new
  sendgrid = SendGridService.new
  @first = mailgun
  @second = sendgrid
 end
 
 
 def send_email(email)
  begin
   @first.send_email(email)
  rescue
   @second.send_email(email)
  end
 end
end