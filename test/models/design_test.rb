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
require "test_helper"

class DesignTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
