Cookr::Application.routes.draw do

  devise_for :users

  resources :recipes
  resources :tags, :only => [:index, :show]

  root :to => 'home#index'

end