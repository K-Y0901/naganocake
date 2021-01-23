class Admin::ItemsController < ApplicationController
  def index
    @items=Item.all
  end
  
  def new
    @item=Item.new
    @genre=Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_item_path(@item)
  end
  
  
  private

  def item_params
    params.require(:item).permit(:genre_id, :item_name, :description, :sale_status, :non_taxed_price, :image_id)
  end
  
end
 