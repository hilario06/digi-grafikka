class CreatePortfolios < ActiveRecord::Migration[6.1]
  def change
    create_table :portfolios do |t|
      t.references :user, null: false, foreign_key: true
      t.float :total_likes, default: 0
      t.float :stars_average, default: 0
      t.text :about
      t.integer :total_followers, default: 0

      t.timestamps
    end
  end
end
