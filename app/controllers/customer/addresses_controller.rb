class Customer::AddressesController < ApplicationController

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to customers_addresses_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def address_params
    params.require(:address).permit(:postcode, :address, :addressee)
  end

end
