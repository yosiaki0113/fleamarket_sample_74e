Rails.application.routes.draw do
  # devise_for :users
  root 'items#index'
  resource :items, only: [:index, :new, :create, :show] do
    collection do
      get 'purchase','done'
    end
  end
end
