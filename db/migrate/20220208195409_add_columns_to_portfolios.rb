class AddColumnsToPortfolios < ActiveRecord::Migration[6.1]
  def change
    add_column :portfolios, :career, :string
    add_column :portfolios, :years_of_experience, :integer
  end
end
