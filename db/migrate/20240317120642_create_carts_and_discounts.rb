class CreateCartsAndDiscounts < ActiveRecord::Migration[7.0]
  def change
    create_table :discounts do |t|
      t.string :code
      t.string :description
      t.integer :value
      t.string :discount_type
      t.date :start_date
      t.date :end_date
      t.decimal :min_spend
      t.integer :max_uses
      t.integer :usage_count
      t.boolean :active
      t.references :user, foreign_key: true

      t.timestamps
    end

    create_table :carts do |t|
      t.string :status
      t.integer :total_items
      t.decimal :total_price
      t.text :notes
      t.string :session_id
      t.references :user, foreign_key: true
      t.references :discount, foreign_key: true

      t.timestamps
    end
  end
end
