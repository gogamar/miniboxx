class CreateImageUrls < ActiveRecord::Migration[7.0]
  def change
    create_table :image_urls do |t|
      t.string :url
      t.integer :position
      t.integer :photo_id
      t.integer :epos_image_id
      t.references :variant, foreign_key: true

      t.timestamps
    end
  end
end
