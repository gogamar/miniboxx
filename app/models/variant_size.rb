class VariantSize < ApplicationRecord
  belongs_to :variant
  belongs_to :size
  has_one :cart_item

  def size_name
    size.name
  end
end
