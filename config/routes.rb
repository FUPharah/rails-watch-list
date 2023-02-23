Rails.application.routes.draw do
  get 'bookmarks/new'
  get 'bookmarks/show'
  get 'bookmarks/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :lists, only: [:new, :create, :show, :index ] do
    resources :bookmarks, only: [:new, :create]
  end
  resources :bookmarks, only:[:destroy]
end
