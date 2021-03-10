class OrdersController < ApplicationController
  def index
  end

  def new
    @end_user=current_end_user
    @order=Order.new
    @addresses=@end_user.addresses
  end

  def confirm
    @order=Order.new(order_params)
    @cart_items=CartItem.all
    @end_user=current_end_user

    if params[:order][:payment_option] == "0"
      @order.payment_option = "クレジットカード"
    elsif params[:order][:payment_option] == "1"
      @order.payment_option = "銀行振込"
    end

    if  params[:order][:address_option] == "0"
      @order.address = current_end_user.last_name
      @order.shipping_code = current_end_user.postcode
      @order.shipping_address = current_end_user.address
    elsif params[:order][:address_option] == "1"
      @order.address = @addresses.address
      @order.shipping_code=@addresses.shipping_code
      @order.shipping_address=@addresses.shipping_address
    elsif params[:order][:address_option] == "2"
      @order=Order.new(order_params)
    end
  end

  def complete
    @end_user=current_end_user
  end


  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to complete_orders_path
  end

  def show
    @end_user=current_end_user
  end



  private

  def order_params
    params.require(:order).permit(:shipping_address, :shipping_code, :address, :end_user_id, :shipping, :billing_amount, :order_status)
  end
end
