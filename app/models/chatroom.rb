class Chatroom < ApplicationRecord
  belongs_to :portfolio
  has_many :messages
end
