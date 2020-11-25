class Customer::OrderCakesController < ApplicationController

  def index
    @order_cakes = Item.where(customer_id: current_customer.id)
    @genres = Genre.all
  end

  def new
    @order_new = OrderCake.new
  end

  def create
    @order_new = OrderCake.new(order_cake_params)
    if @order_new.save
       redirect_to complete_path
    else
       render action: :new
    end
  end

  def complete
  end

  private
  def order_cake_params
    params.require(:order_cake).permit(:customer_id, :cake_type, :delivery_date, :cake_detail, :image, :cake_size, :post_status, :last_name, :first_name)
  end

end
