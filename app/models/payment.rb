class Payment < ApplicationRecord
  def self.create_subscription(token)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    plan = ENV['PAYJP_PLAN_ID']
    customer = Payjp::Customer.create(card: token)
    subscription = Payjp::Subscription.create(plan: plan, customer: customer.id)
    self.create(customer_id: customer.id, subscription_id: subscription.id)
  end
end
