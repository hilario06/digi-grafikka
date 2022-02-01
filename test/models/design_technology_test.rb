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
require "test_helper"

class DesignTechnologyTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
