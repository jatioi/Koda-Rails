


  class Feedback < ApplicationRecord
    # Model code here
    # app/models/feedback.rb
    # Define model validations
    validates :name, presence: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
    validates :message, presence: true, length: { minimum: 10 }

    # Additional model logic, if needed
  end

