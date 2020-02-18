Rails.application.routes.draw do
  root to: "users#index"
  devise_for :users
  resources :users, :only => [:index, :show, :edit, :update]
  resources :favorites, only: [:create, :destroy]
  resources :comedians do
    collection do
      post :confirm
    end
  end
end