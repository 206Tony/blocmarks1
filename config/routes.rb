Rails.application.routes.draw do

  get 'likes/index'

  devise_for :users

  resources :users, only: [:show]

  resources :topics do
  	resources :bookmarks, except: [:index]
  end

  resources :bookmarks, except: [:index] do
  	resources :likes, only: [:index, :create, :destroy] 
  end

  get 'about', to: 'welcome#about'
  root 'welcome#index'

  post :incoming, to: 'incoming#create'
end
