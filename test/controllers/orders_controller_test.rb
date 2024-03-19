require "test_helper"

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get orders_url
    assert_response :success
  end

  test "should get new" do
    get new_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference("Order.count") do
      post orders_url, params: { order: { estimated_delivery_date: @order.estimated_delivery_date, notes: @order.notes, order_number: @order.order_number, payment_method: @order.payment_method, payment_status: @order.payment_status, shipping_cost: @order.shipping_cost, shipping_method: @order.shipping_method, status: @order.status, total_items: @order.total_items, total_price: @order.total_price, tracking_number: @order.tracking_number } }
    end

    assert_redirected_to order_url(Order.last)
  end

  test "should show order" do
    get order_url(@order)
    assert_response :success
  end

  test "should get edit" do
    get edit_order_url(@order)
    assert_response :success
  end

  test "should update order" do
    patch order_url(@order), params: { order: { estimated_delivery_date: @order.estimated_delivery_date, notes: @order.notes, order_number: @order.order_number, payment_method: @order.payment_method, payment_status: @order.payment_status, shipping_cost: @order.shipping_cost, shipping_method: @order.shipping_method, status: @order.status, total_items: @order.total_items, total_price: @order.total_price, tracking_number: @order.tracking_number } }
    assert_redirected_to order_url(@order)
  end

  test "should destroy order" do
    assert_difference("Order.count", -1) do
      delete order_url(@order)
    end

    assert_redirected_to orders_url
  end
end
