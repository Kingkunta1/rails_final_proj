Rails.application.routes.draw do
  get '/more_than_one_sneaker' => 'users#more_than_one_sneaker' 
  get'/signup'=> 'users#new'
  get'/login'=>'sessions#new'
  post'/login'=>'sessions#create'
  delete '/logout' =>'sessions#destroy'

  resources :users do

      resources :sneakers, only:[:index, :show, :new]

  end

  resources :sneakers
  resources :brands, only:[:index,:show]
  resources :stores, only:[:index,:show]
  root 'sessions#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
