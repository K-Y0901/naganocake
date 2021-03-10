class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id
      t.integer :shipping
      t.integer :billing_amount
      t.string :address
      t.string :shipping_address
      t.string :shipping_code
      t.integer :payment_option, default: 0
      t.integer :order_status , default: 0

      t.timestamps
    end
  end
end
