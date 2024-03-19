class CreateSubBrands < ActiveRecord::Migration[7.0]
  def change
    create_table :sub_brands do |t|
      t.string :name
      t.references :brand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
