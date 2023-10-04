class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates_inclusion_of :published, in: [true, false]
  has_many :comments
end