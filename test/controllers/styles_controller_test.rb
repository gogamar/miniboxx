require "test_helper"

class StylesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = styles(:one)
  end

  test "should get index" do
    get styles_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Style.count") do
      post styles_url, params: { product: { care_label: @product.care_label, color_name: @product.color_name, composition: @product.composition, fashion_forward: @product.fashion_forward, fit: @product.fit, gender: @product.gender, quality_description_en: @product.quality_description_en, sales_description_en: @product.sales_description_en, short_description: @product.short_description, size_name: @product.size_name, style_name: @product.style_name, style_number: @product.style_number, variant_id: @product.variant_id, wash_care_en: @product.wash_care_en } }
    end

    assert_redirected_to product_url(Style.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { care_label: @product.care_label, color_name: @product.color_name, composition: @product.composition, fashion_forward: @product.fashion_forward, fit: @product.fit, gender: @product.gender, mark_up: @product.mark_up, quality_description_en: @product.quality_description_en, sales_description_en: @product.sales_description_en, short_description: @product.short_description, size_name: @product.size_name, style_name: @product.style_name, style_number: @product.style_number, variant_id: @product.variant_id, wash_care_en: @product.wash_care_en } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Style.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to styles_url
  end
end
