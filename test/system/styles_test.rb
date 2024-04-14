require "application_system_test_case"

class StylesTest < ApplicationSystemTestCase
  setup do
    @style = styles(:one)
  end

  test "visiting the index" do
    visit styles_url
    assert_selector "h1", text: "Styles"
  end

  test "should create product" do
    visit styles_url
    click_on "New product"

    fill_in "Care label", with: @style.care_label
    fill_in "Color name", with: @style.color_name
    fill_in "Composition", with: @style.composition
    fill_in "Fashion forward", with: @style.fashion_forward
    fill_in "Fit", with: @style.fit
    fill_in "Gender", with: @style.gender
    fill_in "Quality description", with: @style.quality_description_en
    fill_in "Sales description", with: @style.sales_description_en
    fill_in "Short description", with: @style.short_description
    fill_in "Size name", with: @style.size_name
    fill_in "Style name", with: @style.style_name
    fill_in "Style number", with: @style.style_number
    fill_in "Variant", with: @style.variant_id
    fill_in "Wash care", with: @style.wash_care_en
    click_on "Create Style"

    assert_text "Style was successfully created"
    click_on "Back"
  end

  test "should update Style" do
    visit product_url(@style)
    click_on "Edit this product", match: :first

    fill_in "Care label", with: @style.care_label
    fill_in "Color name", with: @style.color_name
    fill_in "Composition", with: @style.composition
    fill_in "Fashion forward", with: @style.fashion_forward
    fill_in "Fit", with: @style.fit
    fill_in "Gender", with: @style.gender
    fill_in "Quality description", with: @style.quality_description_en
    fill_in "Sales description", with: @style.sales_description_en
    fill_in "Short description", with: @style.short_description
    fill_in "Size name", with: @style.size_name
    fill_in "Style name", with: @style.style_name
    fill_in "Style number", with: @style.style_number
    fill_in "Variant", with: @style.variant_id
    fill_in "Wash care", with: @style.wash_care_en
    click_on "Update Style"

    assert_text "Style was successfully updated"
    click_on "Back"
  end

  test "should destroy Style" do
    visit product_url(@style)
    click_on "Destroy this product", match: :first

    assert_text "Style was successfully destroyed"
  end
end
