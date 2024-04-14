class CreateVariants < ActiveRecord::Migration[7.0]
  def change
    create_table :colors do |t|
      t.string :name
      t.string :color_code

      t.timestamps
    end

    create_table :variants do |t|
      t.string :external_id
      t.decimal :wsp_value
      t.decimal :rrp_value
      t.decimal :mark_up
      t.references :style, null: false, foreign_key: true
      t.references :color, foreign_key: true

      t.timestamps
    end
  end
end
