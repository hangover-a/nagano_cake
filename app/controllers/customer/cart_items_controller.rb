class Customer::CartItemsController < ApplicationController

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
    #上記の処理でレコードがある場合は@cart_itemに代入、ない場合は新しくnewで作成して代入する
    unless customer_carts.nil?
      @cart_item = customer_carts
    else
      @cart_item = CartItem.new
      @cart_item.save
    end
    @cart_item = CartItem.new(cart_item_params)
    if @cart_item.save
      redirect_to customers_cart_items_path
    else
      @item = @cart_item.item
      @genres = Genre.all
      @similarity_item = Item.where(genre_id: @item.genre).where.not(id: @item.id)
      render 'customer/items/show'
    end
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
