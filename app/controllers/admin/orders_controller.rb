class Admin::OrdersController < ApplicationController
  def index
    @orders=Order.all
  end

  def show
    @order=Order.find(params[:id])
    @order_items=@order.order_items
  end

  def update
    @order = Order.find(params[:id])
    @order_items=@order.order_items
    @order.update(order_params)
    # binding.pry
    if params[:order][:order_status] == "moneyconfirm"
      # params[:order_item][:production_status] = "wait"
      @order_items.update_all(production_status: "wait")
    end

    redirect_to admin_order_path(@order.id)


  end


  private

  def order_params
    params.require(:order).permit(:order_status)
  end

  # pp = params.require(:production).permit(:name, :director)
  #     pp[:status] = params[:production][:status].to_i
  #     return pp

  # def order_item_params
  #   params.require(:order_item).permit(:production_status)
  # end


end
