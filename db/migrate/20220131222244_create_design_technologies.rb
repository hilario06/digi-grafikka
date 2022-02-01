class CreateDesignTechnologies < ActiveRecord::Migration[6.1]
  def change
    create_table :design_technologies do |t|
      t.references :design, null: false, foreign_key: true
      t.references :technology, null: false, foreign_key: true

      t.timestamps
    end
  end
end
