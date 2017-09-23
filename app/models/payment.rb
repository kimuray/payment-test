class Payment < ApplicationRecord
  enum status: { stop: 0, active: 1 }

  def self.create_subscription(token)
    plan = ENV['PAYJP_PLAN_ID']
    customer = Payjp::Customer.create(card: token)
    subscription = Payjp::Subscription.create(plan: plan, customer: customer.id)
    self.create(customer_id: customer.id, subscription_id: subscription.id)
  end

  def cancel_subscription
    self.stop!
    subscription = Payjp::Subscription.retrieve(self.subscription_id)
    subscription.pause
  end

  def restart_subscription
    self.active!
    subscription = Payjp::Subscription.retrieve(self.subscription_id)
    subscription.resume
  end
end
