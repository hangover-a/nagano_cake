class Customer::ItemsController < ApplicationController
    def index
     @items = Item.all
     @genres = Genres.all
    end
    
    def show
     @item = Item.find(params.id)
     @genres = Genres.all
    end
end
