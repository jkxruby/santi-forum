Rails.application.routes.draw do
  devise_for :users

  root "groups#index"

  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  namespace :admin do
    resources :groups
    resources :posts
  end

end
