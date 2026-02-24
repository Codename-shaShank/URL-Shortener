# TODO(deps): Review usages of 'rails' in this file for version-specific changes.
# TODO(deps): Review usages of 'devise' in this file for version-specific changes.
Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :links
  resources :views, path: "v", only: [:show]
  root "links#index"
end
