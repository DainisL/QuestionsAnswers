Page::Application.routes.draw do

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

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
  
 end
