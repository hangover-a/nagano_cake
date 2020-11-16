class Customer::CustomersController < ApplicationController

  def edit
    @user = current_customer
  end

  def update
    @user = current_customer
    @user.update(customer_params)
    redirect_to customers_path
  end

  private
  def customer_params
    params.require(:customer).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :postcode, :address, :phone_number)
  end

end
