class ItemsController < ApplicationController
  def index
    @end_user=current_end_user
    @items=Item.all
  end

  def show
    @end_user=current_end_user
    @item=Item.find(params[:id])
    @cart_item=CartItem.new
    @end_user=current_end_user
  end
end
