class Customer::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(customer_id: current_customer.id, payment_method: params[:order][:payment_method])
    @cart_item = current_customer.cart_items
    @pricing = total_cost(@cart_item) + @order.delivery_fee
    if params[:order][:address] == "residence"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.addressee = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address] == "delivery_address"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.addressee = @address.addressee
    elsif params[:order][:address] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.addressee = params[:order][:addressee]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to complete_customers_orders_path
  end

  def total_cost(totals)
    cost = 0
    return cost
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :addressee, :total_cost)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :addressee)
  end

end
