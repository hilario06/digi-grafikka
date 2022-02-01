class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true
      t.text :description
      t.integer :status
      t.integer :stars

      t.timestamps
    end
  end
end
