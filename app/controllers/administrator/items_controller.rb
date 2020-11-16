class Administrator::ItemsController < ApplicationController

  def new
    @item_new = Item.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to administrator_item_path(@item)
  end

  def update
  end

  private
  def item_params
    params.require(:item).permit(:name, :discription, :image_id, :genre_id, :price_without_tax, :is_active)
  end

end
