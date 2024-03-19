class ImportsController < ApplicationController
  require 'roo'

  def upload_form
    # Render a form for uploading the file
  end

  def upload_products
    file = params[:file]
    if file.blank?
      redirect_to upload_form_imports_path, alert: 'Please select a file to upload'
      return
    end

    begin
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]
        category = Category.find_or_create_by(name: row['Category'])
        sub_category = SubCategory.find_or_create_by(name: row['Sub Category'], category: category)

        brand = Brand.find_or_create_by(name: row['Brand'])
        sub_brand = SubBrand.find_or_create_by(name: row['Sub Brand'], brand: brand)

        product = Product.find_or_initialize_by(style_number: row['Style Number'])
        product.sub_category = sub_category
        product.sub_brand = sub_brand
        product.style_name = row['Style Name']
        product.sales_description = row['Sales Description']
        product.quality_description = row['Quality Description']
        product.short_description = row['Short Description']
        product.gender = row["Gender"]
        product.fit = row["Fit"]
        product.composition = row["Composition"]
        product.wsp_value = row["WSP Value"]
        product.rrp_value = row["RRP Value"]
        product.mark_up = row["Mark Up"]
        product.care_label = row["Care Label"]
        product.wash_care = row["Wash and Care"]
        product.fashion_forward = row["Fashion Forward"]
        product.save!

        external_variant_id = row['Variant ID']
        variant = Variant.find_or_initialize_by(external_id: external_variant_id)
        variant.product = product
        color = Color.find_or_create_by(color_code: row['Color code'])
        color.name = row['Color Name']

        color.save!
        variant.color = color

        variant.save!

        size = Size.find_or_create_by(name: row['Size Name'])

        variant_size = VariantSize.find_or_initialize_by(variant: variant, size: size)
        variant_size.quantity = row['Quantity'].to_i

        variant_size.save!

        variant.add_image_urls
      end

      redirect_to products_path, notice: 'Products imported successfully'
    rescue StandardError => e
      redirect_to upload_form_imports_path, alert: "An error occurred: #{e.message}"
    end
  end

end
