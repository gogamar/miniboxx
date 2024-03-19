require "application_system_test_case"

class SubBrandsTest < ApplicationSystemTestCase
  setup do
    @sub_brand = sub_brands(:one)
  end

  test "visiting the index" do
    visit sub_brands_url
    assert_selector "h1", text: "Sub brands"
  end

  test "should create sub brand" do
    visit sub_brands_url
    click_on "New sub brand"

    click_on "Create Sub brand"

    assert_text "Sub brand was successfully created"
    click_on "Back"
  end

  test "should update Sub brand" do
    visit sub_brand_url(@sub_brand)
    click_on "Edit this sub brand", match: :first

    click_on "Update Sub brand"

    assert_text "Sub brand was successfully updated"
    click_on "Back"
  end

  test "should destroy Sub brand" do
    visit sub_brand_url(@sub_brand)
    click_on "Destroy this sub brand", match: :first

    assert_text "Sub brand was successfully destroyed"
  end
end
