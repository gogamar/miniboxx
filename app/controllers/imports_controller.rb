class ImportsController < ApplicationController
  require 'roo'

  def upload_form
    # Render a form for uploading the file
  end

  def upload_products
    file = params[:file]
    if file.blank?
      redirect_to upload_form_path, alert: 'Please select a file to upload'
      return
    end

    begin
      spreadsheet = Roo::Spreadsheet.open(file.path)
      header = spreadsheet.row(1)

      (2..spreadsheet.last_row).each do |i|
        row = Hash[[header, spreadsheet.row(i)].transpose]

        supplier = Supplier.find_or_create_by(name: row['Brand'])
        brand = Brand.find_or_create_by(name: row['Sub Brand'])
        category = Category.find_or_create_by(name: row['Category'])
        sub_category = SubCategory.find_or_create_by(name: row['Sub Category'], category: category)
        style = Style.find_or_initialize_by(style_number: row['Style Number'])

        style.supplier = supplier
        style.brand = brand
        style.sub_category = sub_category
        style.style_name = row['Style Name']
        style.sales_description_en = row['Sales Description']
        formatted_sales = style.sales_description_en.gsub("\n", "<br>")
        style.sales_description_en = formatted_sales
        style.quality_description_en = row['Quality Description']
        formatted_quality = style.quality_description_en.gsub("\n", "<br>")
        style.quality_description_en = formatted_quality
        style.short_description = row['Short Description']
        style.gender = row["Gender"]
        style.fit = row["Fit"]
        style.composition = row["Composition"]
        style.care_label = row["Care Label"]
        style.wash_care_en = row["Wash and Care"]
        formatted_wash = style.wash_care_en.gsub("\n", "<br>")
        style.wash_care_en = formatted_wash
        style.fashion_forward = row["Fashion Forward"]
        style.save!

        external_variant_id = row['Variant ID']
        variant = Variant.find_or_initialize_by(external_id: external_variant_id)
        variant.style = style
        color = Color.find_or_create_by(color_code: row['Color code'])
        color.name = row['Color Name']

        color.save!
        variant.color = color
        variant.wsp_value = row["WSP Value"]
        variant.rrp_value = row["RRP Value"]
        variant.mark_up = row["Mark Up"]

        variant.save!

        size = Size.find_or_create_by(name: row['Size Name'])

        product = Product.find_or_initialize_by(variant: variant, size: size)
        product.sales_price = row["RRP Value"]
        product.current_stock = row['Quantity'].to_i
        product.save!

        variant.add_image_urls
      end

      redirect_to products_path, notice: 'Products imported successfully'
    rescue StandardError => e
      redirect_to upload_form_path, alert: "An error occurred: #{e.message}"
    end
  end

  def get_products_from_epos
    EposApiService.new.import_products
  end

  def export_products_to_epos
    EposApiService.new.export_products
  end

end
