class Administrator::ItemsController < ApplicationController

  def new
    @item_new = Item.new
    @genres = Genre.all
    @order_cakes = OrderCake.all
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
    tax = 1.1
    @tax_price = ((@item.price_without_tax * tax).round(2)).ceil
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end

  def create
    @item_new = Item.new(item_params)
    if @item_new.save
      redirect_to administrator_items_path
    else
      render action: :new
      @genres = Genre.all
      @order_cakes = OrderCake.all
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to administrator_item_path(@item)
  end

  private
  def item_params
    params.require(:item).permit(:name, :discription, :image, :genre_id, :price_without_tax, :is_active, :customer_id)
  end

end
