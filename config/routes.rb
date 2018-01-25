Rails.application.routes.draw do
  resources :users
  resources :posts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'index', to: 'home#index', as: :home
  get 'about', to: 'home#about', as: :about
  root 'home#index'
end
