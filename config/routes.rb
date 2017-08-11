Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:show]
  resources :sessions, only: [:new, :destroy, :create]

  resources :proposals, only: [:index, :new, :show, :update, :edit, :create] do
    resources :experiments
  end

  resources :experiments do
    resources :procedures
  end

  get 'experiments/:id/observations' => 'observations#index'
  post 'experiments/:id/observations' => 'observations#create'
  post 'experiments/:id/comments' => 'comments#create'

  root 'proposals#index'
end
