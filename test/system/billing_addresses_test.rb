require "application_system_test_case"

class BillingAddressesTest < ApplicationSystemTestCase
  setup do
    @billing_address = billing_addresses(:one)
  end

  test "visiting the index" do
    visit billing_addresses_url
    assert_selector "h1", text: "Billing addresses"
  end

  test "should create billing address" do
    visit billing_addresses_url
    click_on "New billing address"

    fill_in "Address first", with: @billing_address.address_first
    fill_in "Address second", with: @billing_address.address_second
    fill_in "City", with: @billing_address.city
    fill_in "Country", with: @billing_address.country
    fill_in "Name", with: @billing_address.name
    fill_in "Post code", with: @billing_address.post_code
    fill_in "Region", with: @billing_address.region
    fill_in "Vat number", with: @billing_address.vat_number
    click_on "Create Billing address"

    assert_text "Billing address was successfully created"
    click_on "Back"
  end

  test "should update Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Edit this billing address", match: :first

    fill_in "Address first", with: @billing_address.address_first
    fill_in "Address second", with: @billing_address.address_second
    fill_in "City", with: @billing_address.city
    fill_in "Country", with: @billing_address.country
    fill_in "Name", with: @billing_address.name
    fill_in "Post code", with: @billing_address.post_code
    fill_in "Region", with: @billing_address.region
    fill_in "Vat number", with: @billing_address.vat_number
    click_on "Update Billing address"

    assert_text "Billing address was successfully updated"
    click_on "Back"
  end

  test "should destroy Billing address" do
    visit billing_address_url(@billing_address)
    click_on "Destroy this billing address", match: :first

    assert_text "Billing address was successfully destroyed"
  end
end
