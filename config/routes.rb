Rails.application.routes.draw do

  # administrator
  devise_for :administrators
  namespace :administrator do
    resources :customers,only: [:index,:show,:edit,:update]
  	resources :items,only: [:index,:new,:create,:show,:edit,:update,]
  	get 'top'=>'homes#top'
  	resources :genres,only: [:index,:create,:edit,:update] #show消した
  	resources :orders,only: [:index,:show,:update] do
        resource :order_details,only: [:update], on: :member
    end
  end
  # customer
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
  }

  get 'about' => 'customer/homes#about'
  root 'customer/homes#top'

  scope module: :customer do
    resources :items,only: [:index,:show]
    get 'customer/edit' => 'customers#edit'
    patch 'customer' => 'customers#update'
  	resource :customers,only: [:show] do
  	  get 'quit', on: :collection
  	  patch 'out', on: :collection
      resources :cart_items,only: [:index,:update,:create,:destroy] do
        delete '/' => 'cart_items#destroy_all', on: :collection
      end
      resources :orders,only: [:new,:index,:show,:create] do
        post 'confirm', on: :collection
        get 'complete', on: :collection
      end
      resources :addresses,only: [:index,:create,:edit,:update,:destroy]
    end
  end
end
