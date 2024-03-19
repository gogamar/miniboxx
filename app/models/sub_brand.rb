class SubBrand < ApplicationRecord
  belongs_to :brand
  has_many :products
end
