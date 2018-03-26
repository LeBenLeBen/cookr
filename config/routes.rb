Cookr::Application.routes.draw do

  namespace :admin do
    resources :users
    resources :ingredients
    resources :recipes
    resources :recipes_tags
    resources :tags

    root to: "users#index"
  end

  # Disable user registration but allow profile update
  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
    delete 'users' => 'devise/registrations#destroy', :as => 'destroy_user_registration'
  end

  resources :recipes
  resources :tags, :only => [:index, :show]

  get '/u/:username' => 'users#show', via: :get,
    :constraints => { :username => /[a-zA-Z0-9_.\-]+/ },
    :as => :user

  root :to => 'home#index'

end
