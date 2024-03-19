require "application_system_test_case"

class ShippingAddressesTest < ApplicationSystemTestCase
  setup do
    @shipping_address = shipping_addresses(:one)
  end

  test "visiting the index" do
    visit shipping_addresses_url
    assert_selector "h1", text: "Shipping addresses"
  end

  test "should create shipping address" do
    visit shipping_addresses_url
    click_on "New shipping address"

    fill_in "Address first", with: @shipping_address.address_first
    fill_in "Address second", with: @shipping_address.address_second
    fill_in "City", with: @shipping_address.city
    fill_in "Country", with: @shipping_address.country
    fill_in "Name", with: @shipping_address.name
    fill_in "Phone number", with: @shipping_address.phone_number
    fill_in "Post code", with: @shipping_address.post_code
    fill_in "Region", with: @shipping_address.region
    click_on "Create Shipping address"

    assert_text "Shipping address was successfully created"
    click_on "Back"
  end

  test "should update Shipping address" do
    visit shipping_address_url(@shipping_address)
    click_on "Edit this shipping address", match: :first

    fill_in "Address first", with: @shipping_address.address_first
    fill_in "Address second", with: @shipping_address.address_second
    fill_in "City", with: @shipping_address.city
    fill_in "Country", with: @shipping_address.country
    fill_in "Name", with: @shipping_address.name
    fill_in "Phone number", with: @shipping_address.phone_number
    fill_in "Post code", with: @shipping_address.post_code
    fill_in "Region", with: @shipping_address.region
    click_on "Update Shipping address"

    assert_text "Shipping address was successfully updated"
    click_on "Back"
  end

  test "should destroy Shipping address" do
    visit shipping_address_url(@shipping_address)
    click_on "Destroy this shipping address", match: :first

    assert_text "Shipping address was successfully destroyed"
  end
end
