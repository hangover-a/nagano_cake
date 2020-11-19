class Customer::SearchController < ApplicationController
  PER = 8
  def search
    @value = params["search"]["value"]
    @how = params["search"]["how"]
    datas = search_for(@how, @value)
    @datas = datas.page(params[:page]).per(PER)
    @genres = Genre.all
  end

  private

  def match(value)
    #whereで該当するnameのレコードを取ってくるので、viewではname以外の情報も使える

    Item.where(name: value).or(Item.where(genre_id: value))

  end

  def forward(value)
    Item.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
    Item.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Item.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how
    when 'match'
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end
