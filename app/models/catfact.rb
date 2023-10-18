class Catfact < ApplicationRecord
  belongs_to :user
  validates :catfacts, presence: true
end
