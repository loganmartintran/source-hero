Rails.application.routes.draw do
  resources :topics

  devise_for :users

  get 'about' => 'welcome#about'
  
  root 'welcome#index'
end
