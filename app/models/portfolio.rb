# == Schema Information
#
# Table name: portfolios
#
#  id            :bigint           not null, primary key
#  user_id       :bigint           not null
#  total_likes   :float
#  stars_average :float
#  about         :text
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class Portfolio < ApplicationRecord
  belongs_to :user
  has_many :followers
  has_many :orders
  has_many :designs
end
