Rails.application.routes.draw do
  devise_for :users
  resources :cocktails, except: [:destroy] do
  resources :doses, only: [:new, :edit, :update, :create]
  end
  resources :doses, only: [:destroy]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
