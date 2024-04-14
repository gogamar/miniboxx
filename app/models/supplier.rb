class Supplier < ApplicationRecord
  has_many :brands
  has_many :styles, through: :brands
end
