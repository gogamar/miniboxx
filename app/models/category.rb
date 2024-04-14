class Category < ApplicationRecord
  has_many :sub_categories
  has_many :styles, through: :sub_categories

    scope :with_stock, -> {
    joins(styles: { variants: :products })
      .where('products.current_stock > ?', 0)
      .distinct
  }
end
