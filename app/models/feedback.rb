class Feedback < ApplicationRecord
  validates :first_name, :last_name, :country, :message, presence:true

  end

