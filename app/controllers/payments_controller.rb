class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def new
    @payment = Payment.new
  end

  def create
    Payment.create_subscription(params['payjp-token'])
    redirect_to new_payment_url, notice: '支払い情報を保存しました'
  end
end
