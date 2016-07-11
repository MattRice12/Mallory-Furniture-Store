Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'products/:id', to: 'posts#show'
  get 'products/', to: 'posts#index'
  root 'products#index'

end
