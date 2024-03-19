require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference("Product.count") do
      post products_url, params: { product: { care_label: @product.care_label, color_name: @product.color_name, composition: @product.composition, fashion_forward: @product.fashion_forward, fit: @product.fit, gender: @product.gender, mark_up: @product.mark_up, quality_description: @product.quality_description, quantity: @product.quantity, rrp_value: @product.rrp_value, sales_description: @product.sales_description, short_description: @product.short_description, size_name: @product.size_name, style_name: @product.style_name, style_number: @product.style_number, variant_id: @product.variant_id, wash_care: @product.wash_care, wsp_value: @product.wsp_value } }
    end

    assert_redirected_to product_url(Product.last)
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
    patch product_url(@product), params: { product: { care_label: @product.care_label, color_name: @product.color_name, composition: @product.composition, fashion_forward: @product.fashion_forward, fit: @product.fit, gender: @product.gender, mark_up: @product.mark_up, quality_description: @product.quality_description, quantity: @product.quantity, rrp_value: @product.rrp_value, sales_description: @product.sales_description, short_description: @product.short_description, size_name: @product.size_name, style_name: @product.style_name, style_number: @product.style_number, variant_id: @product.variant_id, wash_care: @product.wash_care, wsp_value: @product.wsp_value } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference("Product.count", -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
