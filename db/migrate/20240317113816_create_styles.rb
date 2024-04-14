class CreateStyles < ActiveRecord::Migration[7.0]
  def change
    create_table :styles do |t|
      t.integer :style_number
      t.string :style_name
      t.text :sales_description_en
      t.text :sales_description_es
      t.text :quality_description_en
      t.text :quality_description_es
      t.text :short_description
      t.string :gender
      t.string :fit
      t.text :composition
      t.string :care_label
      t.text :wash_care_en
      t.text :wash_care_es
      t.text :fashion_forward
      t.references :sub_category, foreign_key: true
      t.references :brand, foreign_key: true

      t.timestamps
    end
  end
end
