Rails.application.routes.draw do
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions'}

  devise_scope :user do
    get 'shipping_addresses', to: 'users/registrations#new_shipping_address'
    post 'create_shipping_addresses', to: 'users/registrations#create_shipping_address'
    get 'likes', to: 'users#likes'

  end
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :items do
    collection do
      get 'show_itemlist'
      get 'purchase','done','card_add','card_new','card_done'
      get 'my_page','my_page_logout'
    end
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    resources :likes, only: [:create, :destroy]
  end
  resources :categories, only: [:index, :show]
end
