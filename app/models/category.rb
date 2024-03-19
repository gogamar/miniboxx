class Category < ApplicationRecord
  has_many :sub_categories
  has_many :products, through: :sub_categories

    scope :with_stock, -> {
    joins(products: { variants: :variant_sizes })
      .where('variant_sizes.quantity > ?', 0)
      .distinct
  }


end
