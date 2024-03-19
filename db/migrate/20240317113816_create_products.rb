class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.integer :style_number
      t.string :style_name
      t.text :sales_description
      t.text :quality_description
      t.text :short_description
      t.string :gender
      t.string :fit
      t.text :composition
      t.decimal :wsp_value
      t.decimal :rrp_value
      t.decimal :mark_up
      t.string :care_label
      t.text :wash_care
      t.text :fashion_forward
      t.references :sub_category, foreign_key: true
      t.references :sub_brand, foreign_key: true

      t.timestamps
    end
  end
end
