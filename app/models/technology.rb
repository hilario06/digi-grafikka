# == Schema Information
#
# Table name: technologies
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Technology < ApplicationRecord
  has_many :designs_technologies
  has_many :portfolios_technologies, dependent: :destroy
  has_many :portfolios, through: :portfolios_technologies
end
