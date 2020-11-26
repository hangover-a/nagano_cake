class Customer::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items
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
    #customer_idがcurrent_customer.idのCartItem内のレコードを探してきて代入
    customer_carts = CartItem.find_by(customer_id: current_customer.id)
    @cart_item = current_customer.cart_items.new(cart_item_params)
    #上記の処理でレコードがある場合は@cart_itemに代入、ない場合は新しくnewで作成して代入する
    if customer_carts.nil?
      if @cart_item.save
        redirect_to customers_cart_items_path
      else
        @item = @cart_item.item
        @genres = Genre.all
        @similarity_item = Item.where(genre_id: @item.genre).where.not(id: @item.id)
        render 'customer/items/show'
      end
    else
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
        if cart_item.item_id == @cart_item.item_id
          new_quantity = cart_item.quantity + @cart_item.quantity
          cart_item.update_attribute(:quantity, new_quantity)
          @cart_item.delete
        else
          @cart_item.save
        end
      end
      redirect_to customers_cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to customers_cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end
end
