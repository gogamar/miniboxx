class AddColorCodeToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :color_code, :string
  end
end
