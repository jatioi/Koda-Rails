class Feedback < ApplicationRecord
  default_scope { where(deleted_at: nil) }
  validates :first_name, :last_name, :country, :message, presence: true

  has_many :notes
  belongs_to :user
  after_create :log_ip_address

  def destroy
    update(deleted_at: Time.now)
  end
end

class Feedback < ApplicationRecord
  enum remark: { good: 0, neutral: 1, bad: 2 } # Specify your options and their integer values
end



private

def log_ip_address
  # Log the IP address of the user using the IpService
  IpService.log_ip_address(self)
end
