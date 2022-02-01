class Portfolio < ApplicationRecord
  belongs_to :user

  has_many :followers
  has_many :orders
end
