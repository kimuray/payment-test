class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.string :customer_id, index: true
      t.string :subscription_id, index: true
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
