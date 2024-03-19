class Product < ApplicationRecord
  belongs_to :sub_category
  # belongs_to :category, through: :sub_category

  belongs_to :sub_brand
  # belongs_to :brand, through: :sub_brand

  has_many :variants

  has_many :cart_items
  has_many :order_items

  # has_many :orders, through: :order_items
end
