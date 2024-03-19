class AddColorToVariants < ActiveRecord::Migration[7.0]
  def change
    add_reference :variants, :color, foreign_key: true
  end
end
