class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :status
      t.integer :order_number
      t.integer :total_items
      t.decimal :total_price
      t.text :notes
      t.string :payment_method
      t.string :payment_status
      t.string :shipping_method
      t.string :shipping_cost
      t.string :estimated_delivery_date
      t.string :tracking_number
      t.references :user, null: false, foreign_key: true
      t.references :billing_address, foreign_key: true
      t.references :shipping_address, foreign_key: true

      t.timestamps
    end
  end
end
