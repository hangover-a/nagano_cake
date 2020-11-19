class Customer::CartItemsController < ApplicationController

  def index
  end

  def destroy_all
    @cart_items = current_customer.cart_items.destroy_all
    redirect_to items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to customers_cart_items_path
  end

  def create
    customer_carts = CartItem.find_by(customer_id: current_customer.id)

    unless customer_carts.nil?
      @cart_item = customer_carts
    else
      @cart_item = CartItem.new
      @cart_item.save
    end
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to customers_cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customers_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity, :customer_id)
  end

end
