Rails.application.routes.draw do
  devise_for :users,
              controllers: { registrations: 'registrations' }

  root 'posts#index'
  post '/follow/:id', to: 'relationships#follow', as: 'follow'
  post '/unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'
  get '/users/:id/following', to: 'users#following', as: 'following_user'
  get '/users/:id/followers', to: 'users#followers', as: 'followers_user'
  get '/posts/search', to: 'posts#search', as: 'search'

  resources :users, only: %i[show index] do
    resources :favorites, only: %i[index]
  end

  resources :posts, only: %i[new create index show destroy search] do
    resources :photos, only: %i[create]
    resources :likes, only: %i[create destroy]
    resources :comments, only: %i[create destroy]
    resources :favorites, only: %i[create destroy]
  end
  resources :notifications, only: %i[index]
end
