class CreateBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :name
      t.integer :epos_supplier_id

      t.timestamps
    end

    create_table :brands do |t|
      t.string :name
      t.integer :epos_brand_id
      t.references :supplier, foreign_key: true

      t.timestamps
    end
  end
end
