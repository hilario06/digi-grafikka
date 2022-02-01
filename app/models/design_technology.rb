# == Schema Information
#
# Table name: design_technologies
#
#  id            :bigint           not null, primary key
#  design_id     :bigint           not null
#  technology_id :bigint           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class DesignTechnology < ApplicationRecord
  belongs_to :design
  belongs_to :technology
end
