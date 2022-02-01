class Design < ApplicationRecord
  belongs_to :portfolio
  has_many :designs_technologies
end
