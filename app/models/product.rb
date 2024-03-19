class Product < ApplicationRecord
  belongs_to :sub_category
  has_one :category, through: :sub_category

  belongs_to :sub_brand
  has_one :brand, through: :sub_brand

  has_many :variants
  has_many :variant_sizes, through: :variants


  # has_many :orders, through: :order_items

  def self.filter_by_category(category_id, products)
    return products unless category_id.present?
    category = Category.find_by(id: category_id)
    return products unless category.present?
    products.joins(:sub_category).where(sub_categories: { id: category.sub_categories.ids })
  end

  def self.filter_by_gender(gender, products)
    products = products.where("gender ILIKE ?", "#{gender}") if gender.present?
    products
  end
end
