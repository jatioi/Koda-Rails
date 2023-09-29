class Feedback < ApplicationRecord
  validates :title, :content, presence:true

  end

