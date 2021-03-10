class Order < ApplicationRecord

  belongs_to :end_user
  has_many :order_items, dependent: :destroy


  enum payment_option: {クレジットカード: 0, 銀行振込: 1}
  enum order_status: {入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中:3, 発送確認:4}


end
