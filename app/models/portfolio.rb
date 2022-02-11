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
  has_many :orders, dependent: :destroy
  has_many :designs, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :portfolios_technologies, dependent: :destroy
  has_many :technologies, through: :portfolios_technologies

  # default_scope { order("created_at DESC") }

  def following?(user)
    !!self.followers.find{|follower| follower.user_id == user.id}
  end

  # Adding technologies to every portfolio
  def self.tagged_with(name)
    Technology.find_by_name!(name).portfolios
  end

  def self.tag_counts
    Technology.select('technologies.*, count(portfolios_technologies.technology_id) as count')
       .joins(:portfolios_technologies).group('portfolios_technologies.technology_id')
  end

  def tag_list
    technologies.map(&:name).join(', ')
  end

  def tag_list=(names)
    self.technologies = names.split(',').map do |n|
      Technology.where(name: n.strip).first_or_create!
    end
  end

  def self.sort_portfolios_by(query)
    case query
    when 'Likes ↓'
      Portfolio.order('total_likes DESC')
    when 'Likes ↑'
      Portfolio.order('total_likes ASC')
    when 'Seguidores ↓'
      Portfolio.order('total_followers DESC')
    else
      Portfolio.order('total_followers ASC')
    end
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
