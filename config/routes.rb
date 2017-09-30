Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:show]

  resources :topics do
  	resources :bookmarks, except: [:index] 
  end

  resources :bookmarks

  root 'welcome#index'

  post :incoming, to: 'incoming#create'
end
