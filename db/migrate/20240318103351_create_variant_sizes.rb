class CreateVariantSizes < ActiveRecord::Migration[7.0]
  def change
    create_table :variant_sizes do |t|
      t.integer :quantity, default: 0
      t.references :variant, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
    end
  end
end
