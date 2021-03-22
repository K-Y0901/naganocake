class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_items, dependent: :destroy


  enum payment_option: {creditcard: 0, bank: 1}
  enum order_status: {waiting: 0, moneyconfirm: 1, construction: 2, preparation:3, confirm:4}


end

