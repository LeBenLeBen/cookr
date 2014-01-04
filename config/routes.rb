Cookr::Application.routes.draw do

  resources :recipes
  resources :tags, :only => [:index, :show]

  root :to => 'home#index'

end