require "application_system_test_case"

class OrdersTest < ApplicationSystemTestCase
  setup do
    @order = orders(:one)
  end

  test "visiting the index" do
    visit orders_url
    assert_selector "h1", text: "Orders"
  end

  test "should create order" do
    visit orders_url
    click_on "New order"

    fill_in "Estimated delivery date", with: @order.estimated_delivery_date
    fill_in "Notes", with: @order.notes
    fill_in "Order number", with: @order.order_number
    fill_in "Payment method", with: @order.payment_method
    fill_in "Payment status", with: @order.payment_status
    fill_in "Shipping cost", with: @order.shipping_cost
    fill_in "Shipping method", with: @order.shipping_method
    fill_in "Status", with: @order.status
    fill_in "Total items", with: @order.total_items
    fill_in "Total price", with: @order.total_price
    fill_in "Tracking number", with: @order.tracking_number
    click_on "Create Order"

    assert_text "Order was successfully created"
    click_on "Back"
  end

  test "should update Order" do
    visit order_url(@order)
    click_on "Edit this order", match: :first

    fill_in "Estimated delivery date", with: @order.estimated_delivery_date
    fill_in "Notes", with: @order.notes
    fill_in "Order number", with: @order.order_number
    fill_in "Payment method", with: @order.payment_method
    fill_in "Payment status", with: @order.payment_status
    fill_in "Shipping cost", with: @order.shipping_cost
    fill_in "Shipping method", with: @order.shipping_method
    fill_in "Status", with: @order.status
    fill_in "Total items", with: @order.total_items
    fill_in "Total price", with: @order.total_price
    fill_in "Tracking number", with: @order.tracking_number
    click_on "Update Order"

    assert_text "Order was successfully updated"
    click_on "Back"
  end

  test "should destroy Order" do
    visit order_url(@order)
    click_on "Destroy this order", match: :first

    assert_text "Order was successfully destroyed"
  end
end
