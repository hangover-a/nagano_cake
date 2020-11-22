class Customer::HomesController < ApplicationController

  def top
    @genres = Genre.all
    @items = Item.where(customer_id: nil)
  end

end
