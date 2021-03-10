class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
    @order_items=OrderItem.all
  end

  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    if params[:order][:order_status] == "1"
       order_item.production_status = "1"
       redirect_to admin_order_path(@order.id)
    end

  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end


end
