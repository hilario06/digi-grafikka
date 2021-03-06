# == Schema Information
#
# Table name: designs
#
#  id           :bigint           not null, primary key
#  portfolio_id :bigint           not null
#  title        :string
#  description  :text
#  likes        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Design < ApplicationRecord
  belongs_to :portfolio
  has_many :designs_technologies
  has_one_attached :photo

  acts_as_votable # para los me gustas
  default_scope { order("created_at DESC") }
end
