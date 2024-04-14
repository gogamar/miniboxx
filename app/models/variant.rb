class Variant < ApplicationRecord
  require 'net/http'
  belongs_to :style
  belongs_to :color
  has_many :products, dependent: :destroy
  has_many :image_urls, dependent: :destroy

  has_many :order_items, through: :products
  has_many :cart_items, through: :products
  has_many :sizes, through: :products

  def add_image_urls
    image_types = ['front', 'front1', 'back', 'back1', 'detail']

    image_types.each_with_index do |image_type, index|
      url = "https://az809753.vo.msecnd.net/images/products/nit__#{external_id}__#{image_type}.jpg"

      image_position = index + 1

      add_image_url(url, image_position)
    end
  end

  private

  def add_image_url(url, position)
    uri = URI(url)

    begin
      response = Net::HTTP.get_response(uri)

      if response.is_a?(Net::HTTPSuccess)
        variant_image = image_urls.find_or_initialize_by(url: url)

        puts "Variant image persisted? #{variant_image.persisted?}"

        unless variant_image.persisted?
          variant_image.variant = self
          variant_image.position = position
          variant_image.save!
        end
      else
        Rails.logger.error("Failed to fetch image from #{url}: #{response.message}")
      end
    rescue StandardError => e
      Rails.logger.error("Error fetching image from #{url}: #{e.message}")
    end
  end

end
