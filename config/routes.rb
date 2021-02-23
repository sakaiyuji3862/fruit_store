Rails.application.routes.draw do

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: [:create, :destroy]
    resources :orders, only: [:index, :create]
    collection do
      get 'search'
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

end
