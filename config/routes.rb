Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }

  root "articles#index"
  resources :articles do
    resource :comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  resources :users
end
