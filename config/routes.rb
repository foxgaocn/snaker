Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :catalogues do
    get :processed, on: :member
  end
end
