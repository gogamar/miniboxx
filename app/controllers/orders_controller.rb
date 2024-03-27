class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
    @order = current_user.orders.find(params[:id])
  end

  def create
    @order  = Order.create!(status: "pending", order_number: Order.count + 1, total_items: current_user.cart.total_items, total_price: current_user.cart.total_price, notes: current_user.cart.notes, shipping_address_id: params[:shipping_address], user: current_user)

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        amount: (@order.total_price * 100).to_i, # Total amount in cents
        currency: 'eur',
        quantity: @order.total_items,
        name: "Miniboxx Order"
      }],
      mode: 'payment',
      success_url: order_url(@order),
      cancel_url: order_url(@order)
    )

    intent = Stripe::PaymentIntent.create({
      amount: amount,
      currency: currency
    })

    order.update(checkout_session_id: session.id)
    redirect_to new_order_payment_path(@order)
  end

 private
    def order_params
      params.require(:order).permit(:status, :order_number, :total_items, :total_price, :notes, :payment_method, :payment_status, :shipping_method, :shipping_cost, :estimated_delivery_date, :tracking_number)
    end
end
