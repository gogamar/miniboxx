require "application_system_test_case"

class ProductsTest < ApplicationSystemTestCase
  setup do
    @product = products(:one)
  end

  test "visiting the index" do
    visit products_url
    assert_selector "h1", text: "Products"
  end

  test "should create product" do
    visit products_url
    click_on "New product"

    fill_in "Care label", with: @product.care_label
    fill_in "Color name", with: @product.color_name
    fill_in "Composition", with: @product.composition
    fill_in "Fashion forward", with: @product.fashion_forward
    fill_in "Fit", with: @product.fit
    fill_in "Gender", with: @product.gender
    fill_in "Mark up", with: @product.mark_up
    fill_in "Quality description", with: @product.quality_description_en
    fill_in "Quantity", with: @product.quantity
    fill_in "Rrp value", with: @product.rrp_value
    fill_in "Sales description", with: @product.sales_description_en
    fill_in "Short description", with: @product.short_description
    fill_in "Size name", with: @product.size_name
    fill_in "Style name", with: @product.style_name
    fill_in "Style number", with: @product.style_number
    fill_in "Variant", with: @product.variant_id
    fill_in "Wash care", with: @product.wash_care_en
    fill_in "Wsp value", with: @product.wsp_value
    click_on "Create Product"

    assert_text "Product was successfully created"
    click_on "Back"
  end

  test "should update Product" do
    visit product_url(@product)
    click_on "Edit this product", match: :first

    fill_in "Care label", with: @product.care_label
    fill_in "Color name", with: @product.color_name
    fill_in "Composition", with: @product.composition
    fill_in "Fashion forward", with: @product.fashion_forward
    fill_in "Fit", with: @product.fit
    fill_in "Gender", with: @product.gender
    fill_in "Mark up", with: @product.mark_up
    fill_in "Quality description", with: @product.quality_description_en
    fill_in "Quantity", with: @product.quantity
    fill_in "Rrp value", with: @product.rrp_value
    fill_in "Sales description", with: @product.sales_description_en
    fill_in "Short description", with: @product.short_description
    fill_in "Size name", with: @product.size_name
    fill_in "Style name", with: @product.style_name
    fill_in "Style number", with: @product.style_number
    fill_in "Variant", with: @product.variant_id
    fill_in "Wash care", with: @product.wash_care_en
    fill_in "Wsp value", with: @product.wsp_value
    click_on "Update Product"

    assert_text "Product was successfully updated"
    click_on "Back"
  end

  test "should destroy Product" do
    visit product_url(@product)
    click_on "Destroy this product", match: :first

    assert_text "Product was successfully destroyed"
  end
end
