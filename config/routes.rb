Page::Application.routes.draw do

 # get "sessions/new"
  #get "users/new"
  root :to => "surveys#index"
  resources :surveys
  resources :answers
  resources :questions
  resources :users
  resources :sessions


   #Authorization
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
 # root :to => "users#new"
  

  # Admin routs
   namespace :admin do
      root :to => 'surveys#index'
      resources :surveys
      resources :answers
      resources :questions
    end
 end
