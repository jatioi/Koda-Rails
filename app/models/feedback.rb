class Feedback < ApplicationRecord
  validates :first_name, :last_name, :country, :message, presence:true

  end

class Feedback < ApplicationRecord
  enum remark: { good: 0, bad: 1, neutral: 2 } # Specify your options and their integer values
end
