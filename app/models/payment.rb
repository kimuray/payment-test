class Payment < ApplicationRecord
  
  def self.create_subscription(token)
    plan = ENV['PAYJP_PLAN_ID']
    customer = Payjp::Customer.create(card: token)
    subscription = Payjp::Subscription.create(plan: plan, customer: customer.id)
    self.create(customer_id: customer.id, subscription_id: subscription.id)
  end

  def cancel_subscription
    subscription = Payjp::Subscription.retrieve(self.subscription_id)
    subscription.pause
  end
end
