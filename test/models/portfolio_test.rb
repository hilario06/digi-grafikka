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
require "test_helper"

class PortfolioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
