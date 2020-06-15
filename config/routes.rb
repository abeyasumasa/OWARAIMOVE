Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
  devise_for :users,
             controllers: { registrations: "users/registrations", except: :edit,
                            omniauth_callbacks: "users/omniauth_callbacks" }
  root "root#index"

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
