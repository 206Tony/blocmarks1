Rails.application.routes.draw do

  devise_for :users, controllers: { sessions: 'users/sessions' }

  resources :topics do
  	resources :bookmarks, except: [:index] 

  end

  resources :bookmarks

  resources :users, only: [:show]
  
  get 'welcome/index'
  get 'welcome/about'
  
  root 'welcome#index'
end
