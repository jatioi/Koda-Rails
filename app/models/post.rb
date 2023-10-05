class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true
  validates_inclusion_of :published, in: [true, false]
  has_many :comments
  has_many :post_category_ships
  has_many :categories, through: :post_category_ships
end