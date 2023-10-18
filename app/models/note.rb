class Note < ApplicationRecord
  belongs_to :feedback, counter_cache: true
  validates :content, presence: true
end
