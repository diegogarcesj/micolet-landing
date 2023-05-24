Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "leads#new"
  resources :leads, only: [:index, :show, :create] do
    resources :survey
  end
end
