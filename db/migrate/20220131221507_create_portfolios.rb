class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_likes
      t.float :stars_average
      t.text :about

      t.timestamps
    end
  end
end
