Rails.application.routes.draw do
  post :incoming, to: 'incoming#create'

  resources :topics do
    resources :bookmarks, except: [:index]
  end

  resources :bookmarks, only: [] do
      resources :likes, only: [:index, :create, :destroy]
  end

  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
