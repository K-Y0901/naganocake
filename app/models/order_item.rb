class OrderItem < ApplicationRecord

  belongs_to :item
  belongs_to :order

  enum production_status: {undo: 0, wait: 1, start: 2, production_completed:3}



end
