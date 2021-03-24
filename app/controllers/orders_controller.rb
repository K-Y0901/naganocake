class OrdersController < ApplicationController
  def index
  end

  def new
    @addresses = Address.all
    @end_user=current_end_user

    @cart_items = @end_user.cart_items
    if @cart_items.empty?
      render  "cart_items/index"
    end

    @end_user=current_end_user
    @order=Order.new
    # session[:order] = @order
    @addresses=@end_user.addresses
  end

  def confirm
    # if @cart_items.blank?
    #   redirect_to cart_items_path
    # end
    @order=Order.new(order_params)
    session[:order] = @order
    @end_user=current_end_user
    @cart_items=@end_user.cart_items

    if @cart_items.empty?
      render  "cart_items/index"
    end

    if params[:order][:payment_option] == "0"
      @order.payment_option == 0
    elsif params[:order][:payment_option] == "1"
      @order.payment_option == 1
    end

    if  params[:order][:address_option] == "0"
      @order.address = current_end_user.last_name
      @order.shipping_code =current_end_user.postcode
      @order.shipping_address = current_end_user.address

    elsif params[:order][:address_option] == "1"
      @order.address = @address.address
      @order.shipping_code=@address.shipping_code
      @order.shipping_address=@address.shipping_address
    elsif params[:order][:address_option] == "2"
      @order=Order.new(order_params)
    end

  end

  def complete
    @end_user= current_end_user
    @cart_items=@end_user.cart_items
    if @cart_items.empty?
      render  "cart_items/index"
    end
    @end_user=current_end_user
  end


  def create
    @order=Order.new(session[:order])
    @order.end_user_id = current_end_user.id
    @order.save
    @cart_item=CartItem.where(end_user_id: current_end_user.id)

    @cart_item.each do |order_item|
    @order_item=OrderItem.new({
      order_id: @order.id,
      item_id: order_item.item_id,
      amount: order_item.amount,
      production_status: "undo",
      price: @order.billing_amount
    })
    # @order_item=OrderItem.new
    # @cart_item.order_id=@order.id
    # @order_item.item_id=order_item.item_id
    # @order_item.amount=order_item.amount
    # @order_item.production_status=0
    # @order_item.price=@order.billing_amount
    @order_item.save
    end

    redirect_to complete_orders_path
  end

  def show
    @end_user=current_end_user
  end



  private

  def order_params
    params.require(:order).permit(:shipping_address, :shipping_code, :address, :payment_option)
  end
end

