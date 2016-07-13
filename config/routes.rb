Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'products/:id', to: 'products#show'
  get 'categories/:id', to: 'categories#show'

  get 'products/', to: 'products#index'
  get 'categories/', to: 'categories#index'

  root 'dashboard#index'

end
