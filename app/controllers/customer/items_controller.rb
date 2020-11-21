class Customer::ItemsController < ApplicationController

    PER = 8

    def index
     @items = Item.page(params[:page]).per(PER)
     @quantity = Item.count
     @genres = Genre.all
    end

    def show
     @item = Item.find(params[:id])
     @cart_item = CartItem.new
     @genres = Genre.all
     @similarity_item = Item.where(genre_id: @item.genre).where.not(id: @item.id)
    end

end