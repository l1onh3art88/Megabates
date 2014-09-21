Megabates::Application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks' } 
  resources :topics
    resources :facts do 
      resources :likes, only: [:create, :destroy] 
    end 
  
  root 'welcome#show'
  match '/users/:id/finish_signup' => 'users#finish_signup', via: [:get, :patch], :as => :finish_signup


  end