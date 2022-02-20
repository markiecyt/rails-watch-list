Rails.application.routes.draw do
  get 'movies/show'
  root 'lists#index'
  resources :lists, only: [ :show, :new, :create ] do
    resources :bookmarks, only: [ :new, :create ]
  end
  resources :bookmarks, only: [ :destroy ]
  resources :movies, only: [ :show ]
end
