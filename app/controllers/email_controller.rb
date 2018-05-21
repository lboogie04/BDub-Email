class EmailController < ApplicationController

    # respond_to :json

    def send_email
      email = Email.new(email_params)
      Rails.logger.info email
     
     if email.valid? && MailerService.send_email(email)
      render json: { email: email_params, message:"Email Processed and Sent", status: 201 }
    else
      render json: { errors: email.errors.full_messages, status: 500 }
    end

    end


    private

    def email_params
      params.require(:email).permit(:to, :to_name, :from, :from_name, :subject, :body)
    end



end