class Review < ApplicationRecord
  belongs_to :portfolio
  belongs_to :user

  def blank_stars
    5 - rating
  end
end
