# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  user_id      :bigint           not null
#  portfolio_id :bigint           not null
#  description  :text
#  status       :integer
#  stars        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
