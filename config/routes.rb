Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  devise_scope :user do
    delete 'sign_out', :to => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  
  root to: 'home#index'
  
  resources :reports
  
  namespace :reports do
    get '/:id/status/:status', action: 'update_status', as: 'update_status'
    get '/:id/archive', action: 'archive', as: 'archive'
  end
  
  resources :applications
  
  namespace :admin do
    get '/', action: 'index', as: 'index'
    post '/users', action: 'update_user', as: 'update_user'
  end
end
