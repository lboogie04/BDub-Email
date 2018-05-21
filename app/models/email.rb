
require 'sanitize'

class Email
    include ActiveModel::Validations
    include ActiveModel::Model
    include ActiveModel::Validations::Callbacks

    attr_accessor :to, :to_name, :from, :from_name, :subject, :body
    #Validations
    validates :to, presence: true
    validates :to_name, presence: true
    validates :from, presence: true
    validates :from_name, presence: true
    validates :subject, presence: true
    validates :body, presence: true

    validates :to, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
    validates :from, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    before_validation :sanitize_body

    def initialize(params)
     @to = params["to"]
		   @to_name = params["to_name"]
		   @from = params["from"]
		   @from_name = params["from_name"]
		   @subject = params["subject"]
		   @body = params["body"]
    end

    def sanitize_body(body)
        sanitized = Sanitize.fragment(body)
        return sanitized
    end
 

end