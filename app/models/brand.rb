class Brand < ApplicationRecord
  has_many :sub_brands
  has_many :products, through: :sub_brands
end
