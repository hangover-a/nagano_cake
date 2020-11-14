Rails.application.routes.draw do
  #administrators
  devise_for :administrators, :controllers => {
    :sessions => 'administrators/sessions'
  }
  #customers
  devise_for :customers, :controllers => {
    :sessions => 'customers/sessions',
    :registrations => 'customers/registrations',
    :passwords => 'customers/passwords'
   }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
