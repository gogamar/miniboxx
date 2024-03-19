require "test_helper"

class SubBrandsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sub_brand = sub_brands(:one)
  end

  test "should get index" do
    get sub_brands_url
    assert_response :success
  end

  test "should get new" do
    get new_sub_brand_url
    assert_response :success
  end

  test "should create sub_brand" do
    assert_difference("SubBrand.count") do
      post sub_brands_url, params: { sub_brand: {  } }
    end

    assert_redirected_to sub_brand_url(SubBrand.last)
  end

  test "should show sub_brand" do
    get sub_brand_url(@sub_brand)
    assert_response :success
  end

  test "should get edit" do
    get edit_sub_brand_url(@sub_brand)
    assert_response :success
  end

  test "should update sub_brand" do
    patch sub_brand_url(@sub_brand), params: { sub_brand: {  } }
    assert_redirected_to sub_brand_url(@sub_brand)
  end

  test "should destroy sub_brand" do
    assert_difference("SubBrand.count", -1) do
      delete sub_brand_url(@sub_brand)
    end

    assert_redirected_to sub_brands_url
  end
end
