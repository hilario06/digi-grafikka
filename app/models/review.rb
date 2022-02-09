class Review < ApplicationRecord
  belongs_to :portfolio
  belongs_to :user
  validates :rating, presence: true
  def blank_stars
    5 - rating
  end
end
