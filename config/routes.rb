Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show]

  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index, :show]
  end

  resources :bookmarks, only: [] do
      resources :likes, only: [:index, :create, :destroy]
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
