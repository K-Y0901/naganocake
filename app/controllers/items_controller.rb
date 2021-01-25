class ItemsController < ApplicationController
  def index
    @end_user=current_end_user
    @items=Item.all
  end

  def show
    @item=Item.find(params[:id])
  end
end
