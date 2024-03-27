class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :color_code

      t.timestamps
    end

    create_table :variants do |t|
      t.string :external_id
      t.references :product, null: false, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
