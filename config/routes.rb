Rails.application.routes.draw do
  get'/signup'=> 'users#new'
  get'/login'=>'sessions#new'
  post'/login'=>'sessions#create'
  get '/users/more_than_one_sneaker' => 'users#more_than_one_sneaker'
  delete '/logout' =>'sessions#destroy'
  get'/auth/google_oauth2/callback' => 'sessions#google'
  get '/category_search' => 'categories#category_search'
  get '/search' => 'brands#search'



  resources :users do

      resources :sneakers, only:[:index, :show, :new]

  end


  # ominauth response back from server
  resources :categories, only:[:index,:show,:new,:create]
  resources :sneakers
  resources :brands, only:[:index,:show]
  resources :stores, only:[:index,:show]
  root 'sessions#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
