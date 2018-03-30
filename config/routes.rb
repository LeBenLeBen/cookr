Cookr::Application.routes.draw do

  concern :paginatable do
    get ':id/(page/:page)', action: :show, on: :collection, as: ''
  end

  namespace :admin do
    resources :users
    resources :ingredients
    resources :recipes
    resources :recipes_tags
    resources :tags

    root to: "users#index"
  end

  # Disable user registration but allow profile update
  devise_for :users, skip: [:registrations]
  as :user do
    get 'users/edit', to: 'devise/registrations#edit', as: 'edit_user_registration'
    put 'users', to: 'devise/registrations#update', as: 'user_registration'
    delete 'users', to: 'devise/registrations#destroy', as: 'destroy_user_registration'
  end

  resources :recipes, except: [:index]
  resources :tags, only: [:show], concerns: :paginatable

  get '/u/:username', to: 'users#show', via: :get,
    constraints: { username: /[a-zA-Z0-9_.\-]+/ },
    as: :user

  root to: 'home#index'

end
