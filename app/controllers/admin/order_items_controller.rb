class Admin::OrderItemsController < ApplicationController

  def update
    # @order=Order.find(params[:id])
    # @order_items=@order.order_items
    @order_item = OrderItem.find(params[:id])
    @order = @order_item.order
    @order_item.update(order_item_params)
    if params[:order_item][:production_status] == "start"
       @order.update(order_status: "construction")
    end

    @order_items = @order.order_items
    count = 0
    @order_items.each do |order_item|
      if order_item.production_status == "production_completed"
        count = count + 1
      end
    end
    # binding.pry
    if @order_items.count == count
       @order.update(order_status: "preparation")
    end
    redirect_to admin_order_path(@order)


  end



  private

  # def order_params
  #   params.require(:order).permit(:order_status)
  # end

  def order_item_params
    params.require(:order_item).permit(:production_status)
  end
end