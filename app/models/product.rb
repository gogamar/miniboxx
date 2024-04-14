class Product < ApplicationRecord
  belongs_to :variant
  belongs_to :size
  has_one :cart_item

  validates :sales_price, presence: true

  def size_name
    size.name
  end
end
