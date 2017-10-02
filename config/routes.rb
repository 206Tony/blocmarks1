Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  resources :topics do
  	resources :bookmarks, except: [:index]
  end

  resources :bookmarks, except: [:index] do
  	resources :likes, only: [:index, :create, :destroy] 
  end

  authenticated :user do
    root 'topic#index', as: :authenticated_root
  end

  post :incoming, to: 'incoming#create'

  root 'welcome#index'

  get 'users/show'

  get 'likes/index'

  get 'about', to: 'welcome#about'

  get 'welcome', to: 'welcome#index'
end
