Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:index, :show, :edit, :update]

  resources :lives, only: :index
  resources :lives, as: :live, except: :index

  resources :favorites, only: [:index, :create, :destroy]
  resources :participant_managements, only: [:create, :destroy]

  resources :comedians do
    collection do
      post :confirm
    end
  end
end