Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'products/:id', to: 'products#show'
  get 'products/', to: 'products#index'
  root 'dashboard#index'

end
