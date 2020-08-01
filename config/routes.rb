Rails.application.routes.draw do
  devise_for :users, controllers: {registrations: 'users/registrations'}

  devise_scope :user do
    get 'shipping_addresses', to: 'users/registrations#new_shipping_address'
    post 'shipping_addresses', to: 'users/registrations#create_shipping_address'
  end
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resource :items, only: [:index, :new, :create, :show] do
    collection do
      get 'show_itemlist'
      get 'purchase','done','card_add','card_new','card_done'
      get 'my_page','my_page_logout'
    end
  end
end
