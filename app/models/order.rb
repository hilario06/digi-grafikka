class Order < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
end
