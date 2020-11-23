class StocksController < ApplicationController

  def index
    @stock_items = Stock.get_stock_items(current_customer)
    # @stock_items = Kaminari.paginate_array(stock_items).page(params[:page]).per(10)
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
