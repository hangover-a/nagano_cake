class Customer::OrdersController < ApplicationController

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def new
    if current_customer.cart_items.empty?
      redirect_to items_path
    else
      @order = Order.new
      @addresses = Address.where(customer_id: current_customer.id)
    end
  end

  def confirm
    @order = Order.new(customer_id: current_customer.id, payment_method: params[:order][:payment_method])
    @cart_items = current_customer.cart_items
    @order.delivery_fee = 800
    if params[:order][:address_select] == "residence"
      @order.postcode = current_customer.postcode
      @order.address = current_customer.address
      @order.addressee = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_select] == "delivery_address"
      @address = Address.find(params[:order][:address_id])
      @order.postcode = @address.postcode
      @order.address = @address.address
      @order.addressee = @address.addressee
    elsif params[:order][:address_select] == "new_address"
      @order.postcode = params[:order][:postcode]
      @order.address = params[:order][:address]
      @order.addressee = params[:order][:addressee]
    end
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.delivery_fee = 800
    if @order.save
      redirect_to complete_customers_orders_path, notice: 'Thank you for your order.'
      @cart_items = current_customer.cart_items
      @cart_items.each do |cart|
        OrderDetail.create(item_id: cart.item.id, order_id: @order.id, quantity: cart.quantity, making_status: 0, price: cart.sub_price)
        # (((cart.item.price_without_tax) * 1.1).floor * cart.quantity))
      end
      @cart_items.destroy_all
    end
  end

  def show
    @order = Order.find(params[:id])
    @order.customer_id = current_customer.id
    @order_details = @order.order_details
    @order.delivery_fee = 800
  end

  def complete
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postcode, :address, :addressee, :total_cost)
  end

  def address_params
    params.require(:order).permit(:postcode, :address, :addressee)
  end

end
