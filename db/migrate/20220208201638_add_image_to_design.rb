class AddImageToDesign < ActiveRecord::Migration[6.1]
  def change
    add_column :designs, :image, :string
  end
end
