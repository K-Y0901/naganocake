class Item < ApplicationRecord

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_items, dependent: :destroy

  # def self.search(search)
  #     return Item.all unless search
  #     Item.where(['content LIKE ?', "%#{search}%"])
  # end


  def self.search(search)
    if search
      Item.where(['item_name LIKE ?', "%#{search}%"])
    else
      Item.all
    end
  end

  # enum sale_status: {販売中: 0, 売り切れ: 1}



  attachment :image

end
