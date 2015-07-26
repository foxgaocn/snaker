Rails.application.routes.draw do
  devise_for :users

  root 'home#index'

  resources :catalogues do
    get :processed, on: :member
    get :processing, on: :member
  end
end
