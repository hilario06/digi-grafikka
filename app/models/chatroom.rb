# == Schema Information
#
# Table name: chatrooms
#
#  id           :bigint           not null, primary key
#  portfolio_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Chatroom < ApplicationRecord
  belongs_to :portfolio
  has_many :messages, dependent: :destroy
end
