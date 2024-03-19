class CreateBillingAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :billing_addresses do |t|
      t.string :name
      t.string :vat_number
      t.string :address_first
      t.string :address_second
      t.string :post_code
      t.string :city
      t.string :region
      t.string :country
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
