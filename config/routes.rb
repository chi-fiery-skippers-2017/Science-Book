Rails.application.routes.draw do

  resources :experiments do 
  	resources :procedures
  end
  

  resources :proposals, only: [:index, :new, :show, :update, :edit, :create]
  root 'experiments#index'
end
