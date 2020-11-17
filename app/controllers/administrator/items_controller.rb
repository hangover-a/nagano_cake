class Administrator::ItemsController < ApplicationController

  def new
    @item_new = Item.new
    @genres = Genre.all
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to administrator_items_path
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :discription, :image, :genre_id, :price_without_tax, :is_active)
  end

end
