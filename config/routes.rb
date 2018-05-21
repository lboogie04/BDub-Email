Rails.application.routes.draw do

  post '/email', to: 'email#send_email'

end
