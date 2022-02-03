# == Schema Information
#
# Table name: followers
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  portfolio_id :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Follower < ApplicationRecord
  belongs_to :user
  belongs_to :portfolio
end
