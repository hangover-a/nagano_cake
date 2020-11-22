class StocksController < ApplicationController

  def index
  end

  def create
    @item = Item.find(params[:item_id])
    unless @item.stocked?(current_customer)
      @item.stock(current_customer)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

  def destroy
    @item = Stock.find(params[:id]).item
    if @item.stocked?(current_customer)
      @item.unstock(current_customer)
      respond_to do |format|
        format.html { redirect_to request.referrer || root_url }
        format.js
      end
    end
  end

end
