class PaymentsController < ApplicationController

  def pay
    @order = Order.find(params[:order_id])
    if @order.payment_intent_id
      payment_intent = get_payment_intent
    else
      payment_intent = create_payment_intent
      @order.update!(payment_intent_id: payment_intent.id)
    end
    @payment_intent_client_secret = payment_intent.client_secret
  end

  private

  def create_payment_intent
    Stripe::PaymentIntent.create({
      amount: (@order.total_price * 100).to_i,
      currency: 'eur',
      automatic_payment_methods: {enabled: true},
      description: "Order #{@order.id}"
    })
  end

  def get_payment_intent
    Stripe::PaymentIntent.retrieve(@order.payment_intent_id)
  end

end
