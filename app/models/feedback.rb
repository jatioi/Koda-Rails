class Feedback < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  validates :first_name, :last_name, :country, :message, presence: true

  def destroy
    update(deleted_at: Time.now)
  end
end

class Feedback < ApplicationRecord
  enum remark: { good: 0, neutral: 1, bad: 2 } # Specify your options and their integer values
end
