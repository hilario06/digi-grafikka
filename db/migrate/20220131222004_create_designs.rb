class CreateDesigns < ActiveRecord::Migration[6.1]
  def change
    create_table :designs do |t|
      t.references :portfolio, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.integer :likes

      t.timestamps
    end
  end
end
