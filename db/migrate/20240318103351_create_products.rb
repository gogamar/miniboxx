class CreateProducts< ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :current_stock, default: 0
      t.integer :epos_product_id
      t.string :barcode
      t.decimal :sales_price
      t.references :variant, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
