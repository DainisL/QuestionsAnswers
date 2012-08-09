Page::Application.routes.draw do
  
#===============================
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

 #===============================
  root :to => "surveys#index"
  resources :surveys
  resources :answers
  resources :questions
  resources :users
  resources :sessions
#================================S

   #Authorization User
  get "log_out" => "sessions#destroy", :as => "log_out"
  get "log_in" => "sessions#new", :as => "log_in"
  get "sign_up" => "users#new", :as => "sign_up"
  
 end
