require "open-uri"
require "nokogiri"

class DescriptionService
  def scrape_es_description(url)
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML.parse(html_file)

    description_element = html_doc.at_css('[data-event-label="Product description"]')
    if description_element
      sales_desc_es = description_element.at_css('.product-content__text').text.strip
    else
      puts "Element with data-event-label=\"Product description\" not found"
    end

    quality_element = html_doc.at_css('[data-event-label="Materials and care"]')
    if quality_element
      quality_desc_es = quality_element.at_css('.accordion__content p').text.strip
      care_desc_es = quality_element.at_css('.product-content__list')
    else
      puts "Element with data-event-label=\"Materials and care\" not found"
    end

    [sales_desc_es, quality_desc_es, care_desc_es]
  rescue StandardError => e
    Rails.logger.error("Error scraping website: #{e.message}")
    []
  end
end
