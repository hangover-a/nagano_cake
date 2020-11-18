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
    @cart_items = current_customer.cart_items
    @order.delivery_fee = 800
    pricing = total_cost(@cart_item) + @order.delivery_fee
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
      @add = "1"
    end
  end

  def create
    @order = Order.new(order_params)
    @order.save
    flash[:notice] = "Thank you for your order."
    redirect_to complete_customers_orders_path
    if params[:order][:add] == "1"
      current_customer.address.create(address_params)
    end
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart|
      OrderDetail.create(item: cart.item, order: @order, amount: item.quantity, price: sub_price(cart))
    end
    @cart_items.destroy_all
  end
  
  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def complete
  end
  
  def price_tax_included(price)
    (price * 1.1).floor
  end
  
  def sub_price(sub)
    price_tax_included(sub.item.price_without_tax) * sub.quantity
  end

  def total_cost(totals)
    cost = 0
    totals.each do |total|
      price  +=  sub_price(total)
    end
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
