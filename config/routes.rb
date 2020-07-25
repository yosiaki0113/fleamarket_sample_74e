Rails.application.routes.draw do
  root 'items#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resource :items, only: [:index, :new, :create, :show] do
    collection do
      get 'show_itemlist'
    end
  end
end
