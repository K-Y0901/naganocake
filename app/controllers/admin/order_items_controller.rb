class Admin::OrderItemsController < ApplicationController

  def update
    order_item = OrderItem.find(params[:id])
    @order = order_item.order
    order_item.update(order_item_params)
    if params[:order_item][:production_status] == "2"
       @order.order_status = "2"
       redirect_to admin_orders_path(order_item)
    end

    count = 0
    @order.order_items.each do |a|
      if params[:order_item][:production_status] == "3"
        count = count + 1
      end
      if @order.order_items.count=count
        params[:order][:order_status] == "3"
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