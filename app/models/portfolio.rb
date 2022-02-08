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
  has_many :followers, dependent: :destroy
  has_many :orders
  has_many :designs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  def following?(user)
    !!self.followers.find{|follower| follower.user_id == user.id}
  end

  def new_follower!
    self.update_columns(total_followers: (self.total_followers + 1))
  end

  def subtracting_follower!
    self.update_columns(total_followers: (self.total_followers - 1))
  end

  def new_like!
    self.update_columns(total_likes: (self.total_likes + 1))
  end

  def subtracting_like!
    self.update_columns(total_likes: (self.total_likes - 1))
  end
end
