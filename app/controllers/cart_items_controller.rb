class CartItemsController < ApplicationController
  def index
    @end_user=current_end_user
    @cart_items=CartItem.all
  end

  def update
    cart_item=CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path

  end

  # def create
  #   @cart_item=CartItem.new(cart_item_params)
  #   @cart_item.end_user_id = current_end_user.id

  #   if  current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
  #     @cart_item.amount += params[:cart_item][:amount].to_i
  #     @cart_item.save
  #     redirect_to cart_items_path
  #   else
  #     @cart_item.save
  #     redirect_to cart_items_path
  #   end
  # end

  def create
  @cart_item = CartItem.new(cart_item_params)
  @cart_item.end_user_id = current_end_user.id
  @cart_items = current_end_user.cart_items.all
  @cart_items.each do |cart_item|
    if cart_item.item_id == @cart_item.item_id
      new_amount = cart_item.amount + @cart_item.amount
      cart_item.update_attribute(:amount, new_amount)
      @cart_item.delete
    end
  end
  @cart_item.save
  redirect_to cart_items_path
  end





  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
