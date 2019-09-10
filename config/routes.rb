Rails.application.routes.draw do
  get'/signup'=> 'users#new'
  get'/login'=>'sessions#new'
  post'/login'=>'sessions#create'
  delete '/logout' =>'sessions#destroy'

  resources :sneakers
  resources :brands, only:[:index,:show]
  resources :stores, only:[:index,:show]
  resources :users
  root 'sessions#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
