class PaymentsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :webhook

  def new
    @payment = Payment.new
    @stop_payments = Payment.stop
    @active_payments = Payment.active
  end

  def create
    Payment.create_subscription(params['payjp-token'])
    redirect_to new_payment_url, notice: '支払い情報を保存しました'
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.cancel_subscription
    redirect_to new_payment_url, notice: '定期課金をキャンセルしました'
  end

  def restart
    payment = Payment.find(params[:id])
    payment.restart_subscription
    redirect_to new_payment_url, notice: '定期課金を再開しました'
  end
end
