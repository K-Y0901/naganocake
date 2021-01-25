class CartItemsController < ApplicationController
  def index
    @end_user=current_end_user
    @cart_items=CartItem.all
  end

  def update

  end

  def destroy

  end

  def destroy_all

  end

  def create

  end

end
