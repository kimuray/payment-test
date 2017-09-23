class PaymentsController < ApplicationController
  def new
    @payment = Payment.new
  end

  def create
    token = params['payjp-token']
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    customer = Payjp::Customer.create(card: token)
    Payment.create(customer_id: customer.id)
    redirect_to new_payment_url, notice: '支払い情報を保存しました'
  end
end
