class Customer::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end
  
  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end
  
  def confirm
    @order = Order.new(order_params)
    if @order.invalid?
      render :new
    end
  end
  
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_customers_orders_path
  end
  
  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :addressee)
  end

end
