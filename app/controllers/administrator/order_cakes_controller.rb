class Administrator::OrderCakesController < ApplicationController

  def index
    @order_cakes = OrderCake.all
  end

  def show
    @order_cake = OrderCake.find(params[:id])
  end

  def update
    @order_cake = OrderCake.find(params[:id])
    @order_cake.update(order_cake_params)
    redirect_to administrator_order_cake_path
  end
  private
  def order_cake_params
    params.require(:order_cake).permit(:customer_id, :cake_type, :delivery_date, :cake_detail, :image, :cake_size, :post_status, :last_name, :first_name)
  end

end
