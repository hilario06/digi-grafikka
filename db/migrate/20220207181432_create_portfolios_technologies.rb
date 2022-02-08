class CreatePortfoliosTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios_technologies do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
