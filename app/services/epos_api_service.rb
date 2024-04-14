require 'httparty'

class EposApiService
  include HTTParty
  base_uri 'https://api.eposnowhq.com/api/v4'

  attr_accessor :auth_token

  def initialize
    @auth_token = ENV['EPOS_API_TOKEN']
  end

  def import_products
    response = self.class.get('/Style', headers: {
      'Authorization' => "Basic #{@auth_token}",
      'Content-Type' => 'application/json'
    })

    if response.success?
      epos_products = JSON.parse(response.body)
      epos_products.each do |epos_product|
        product = Style.find_or_create_by(style_number: epos_product["ArticleCode"]) do |prod|
          prod.short_description = epos_product["Description"]
          prod.save!(validate: false)
        end

        product = product.products.find_or_create_by(barcode: epos_product["Barcode"]) do |product|
          varsize.variant.style_id = product.id
          varsize.epos_product_id = epos_product["Id"]
          varsize.wsp_value = epos_product["CostPrice"]
          varsize.rrp_value = epos_product["SalePrice"]
          varsize.save!(validate: false)
        end
        break
      end
    else
      raise "Request failed with code #{response.code}: #{response.message}"
    end
  end

  def create_suppliers
    [
      {
        "Id": 0,
        "Name": "string",
        "Description": "string",
        "AddressLine1": "string",
        "AddressLine2": "string",
        "Town": "string",
        "County": "string",
        "PostCode": "string",
        "ContactNumber": "string",
        "ContactNumber2": "string",
        "EmailAddress": "string",
        "Type": "string",
        "ReferenceCode": "string"
      }
    ]
  end

  def create_brands
    [
      {
        "Id": 0,
        "Name": "string",
        "Description": "string"
      }
    ]
  end

  def create_categories
    # get categories from epos to know which ones are already created
    # create the missing categoris

  end

  def export_products

    products = []

    products_not_on_epos = Product.where(epos_product_id: nil)

    products_not_on_epos.each do |product|
        product_to_export =
        {
          "Id": 0,
          "Name": "#{product.variant.style.style_number} #{product.variant.color&.name} #{product.size&.name}",
          "Description": product.variant.style.short_description,
          "CostPrice": product.variant.wsp_value,
          "IsCostPriceIncTax": false,
          "SalePrice": product.sales_price,
          "IsSalePriceIncTax": true,
          "EatOutPrice": 0,
          "IsEatOutPriceIncTax": true,
          "CategoryId": 0,
          "Barcode": product.barcode,
          "SalePriceTaxGroupId": 0,
          "EatOutPriceTaxGroupId": 0,
          "CostPriceTaxGroupId": 0,
          "BrandId": 0,
          "SupplierId": 0,
          "PopupNoteId": 0,
          "UnitOfSale": 0,
          "VolumeOfSale": 0,
          "VariantGroupId": 0,
          "MultipleChoiceNoteId": 0,
          "Size": product.size.name,
          "Sku": product.barcode,
          "SellOnWeb": true,
          "SellOnTill": true,
          "OrderCode": "",
          "SortPosition": 0,
          "RrPrice": product.variant.rrp_value,
          "StyleType": 0,
          "TareWeight": 0,
          "ArticleCode": product.variant.style.style_number,
          "IsTaxExemptable": false,
          "ReferenceCode": "",
          "IsVariablePrice": false,
          "IsArchived": false,
          "ColourId": 0,
          "MeasurementDetails": {
            "SalePriceMeasurementSchemeItemId": 0,
            "SalePriceMeasurementUnitVolume": 0,
            "SalePriceFactor": 0,
            "SalePriceUnit": "string",
            "CostPriceMeasurementSchemeItemId": 0,
            "CostPriceMeasurementUnitVolume": 0,
            "CostPriceFactor": 0,
            "CostPriceUnit": "string"
          },
          "Supplier": {
            "Id": 0,
            "Name": "string",
            "Description": "string",
            "AddressLine1": "string",
            "AddressLine2": "string",
            "Town": "string",
            "County": "string",
            "PostCode": "string",
            "ContactNumber": "string",
            "ContactNumber2": "string",
            "EmailAddress": "string",
            "Type": "string",
            "ReferenceCode": "string"
          },
          "SalePriceTaxGroup": {
            "Id": 0,
            "Name": "string",
            "TaxRates": [
              {
                "TaxGroupId": 0,
                "TaxRateId": 0,
                "LocationId": 0,
                "Priority": 0,
                "Percentage": 0,
                "Name": "string",
                "Description": "string",
                "TaxCode": "string"
              }
            ]
          },
          "EatOutPriceTaxGroup": {
            "Id": 0,
            "Name": "string",
            "TaxRates": [
              {
                "TaxGroupId": 0,
                "TaxRateId": 0,
                "LocationId": 0,
                "Priority": 0,
                "Percentage": 0,
                "Name": "string",
                "Description": "string",
                "TaxCode": "string"
              }
            ]
          },
          "CostPriceTaxGroup": {
            "Id": 0,
            "Name": "string",
            "TaxRates": [
              {
                "TaxGroupId": 0,
                "TaxRateId": 0,
                "LocationId": 0,
                "Priority": 0,
                "Percentage": 0,
                "Name": "string",
                "Description": "string",
                "TaxCode": "string"
              }
            ]
          },
          "StyleTags": [
            {
              "Id": 0,
              "Name": "string"
            }
          ],
          "StyleUdfs": [
            {
              "Id": 0,
              "Name": "string",
              "Value": "string"
            }
          ],
          "StyleLocationAreaPrices": [
            {
              "LocationAreaId": 0,
              "SalePrice": 0,
              "EatOutPrice": 0,
              "CostPriceExcTax": 0
            }
          ],
          "StyleImages": [
            {
              "StyleImageId": 0,
              "ImageUrl": product.variant.image_urls.find_by(position: 1),
              "MainImage": true
            }
          ],
          "IsMultipleChoiceStyleOptional": true
        }
    end

    headers = {
      'Authorization' => "Basic #{@auth_token}",
      'Content-Type' => 'application/json'
    }

    response = post('', body: products.to_json, headers: headers)

    if response.success?
      puts JSON.parse(response.body)
    else
      raise "Request failed with code #{response.code}: #{response.message}"
    end
  end
end
