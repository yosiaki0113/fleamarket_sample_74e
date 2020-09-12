Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'likes/create'
  get 'likes/destroy'
  devise_for :users, controllers: {registrations: 'users/registrations', sessions: 'users/sessions', omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get 'shipping_addresses', to: 'users/registrations#new_shipping_address'
    post 'create_shipping_addresses', to: 'users/registrations#create_shipping_address'
    get 'likes', to: 'users#likes'
    get 'sorry_google', to: 'users/registrations#sorry_google'
    get 'sorry_google_login', to: 'users/sessions#sorry_google_login'
  end
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :items do
    collection do
      get 'show_itemlist'
      get 'purchase','done','card_add','card_new','card_done'
      get 'my_page','my_page_logout'
      get 'search'
    end
    collection do
      get 'category_children', defaults: { format: 'json' }
      get 'category_grandchildren', defaults: { format: 'json' }
    end
    resources :likes, only: [:create, :destroy]
    resources :order, only: [:index]
    post 'pay', to: 'order#pay'
    get 'done', to: 'order#done'

  end
  resources :categories, only: [:index, :show]
  
  resources :card, only: [:index, :new, :show, :destroy] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
      get 'card_add'
    end
  end
end
