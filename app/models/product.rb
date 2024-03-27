class Product < ApplicationRecord
  require 'net/http'
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

  def get_es_description
    scraper_service = DescriptionService.new
    variants.each do |variant|
      var_color = variant.color.name.gsub(' ', '')
      url = "https://www.nameit.com/es-es/#{style_number}_#{var_color}.html"

      if url_exists?(url)
        scraped_descriptions = scraper_service.scrape_es_description(url)
        return unless scraped_descriptions.present?

        formatted_description = scraped_descriptions[0].gsub("\n", "<br>")

        self.update!(
          sales_description_es: formatted_description,
          quality_description_es: scraped_descriptions[1],
          wash_care_es: scraped_descriptions[2]
        )
        sleep(1)
      else
        puts "URL #{url} does not exist"
      end
    end
  end

  def url_exists?(url)
    uri = URI.parse(url)
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = (uri.scheme == 'https')

    # Make a HEAD request to the URL
    response = http.request_head(uri.path)

    puts "!response.code.to_i == 404: #{!response.code.to_i == 404}"
    puts "this is the response code: #{response.code}"

    return !(response.code.to_i == 404)

  rescue StandardError
    false
  end
end
