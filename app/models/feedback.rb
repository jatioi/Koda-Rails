class Feedback < ApplicationRecord
  validates :first_name, :last_name, :country, :message, presence:true

  end

class Feedback < ApplicationRecord
  enum remark: { good: 0, neutral: 1, bad: 2 } # Specify your options and their integer values
end
