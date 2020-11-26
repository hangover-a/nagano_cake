class Customer::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def create
    @addresses = current_customer.addresses.all
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    render :create
  end

  def edit
    @address = Address.find_by(id: params[:id], customer_id: current_customer.id)
  end

  def update
    @address = Address.find_by(id: params[:id], customer_id: current_customer.id)
    @address.update(address_params)
    redirect_to customers_addresses_path
  end

  def destroy
    @address = Address.find_by(id: params[:id], customer_id: current_customer.id)
    @address.destroy
    @addresses = current_customer.addresses.all
    render :destroy
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :addressee)
  end

end
