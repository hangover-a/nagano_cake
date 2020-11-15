class Administrator::CustomersController < ApplicationController
  
  before_action :authenticate_administrator!
  
  def index
    @customers = Customer.all
  end

  
end
