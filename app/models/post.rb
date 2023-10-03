class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates_inclusion_of :published, in: [true, false]
end