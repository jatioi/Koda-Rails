class Catfact < ApplicationRecord
  validates :catfacts, presence: true
  belongs_to :user
end
