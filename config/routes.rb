Rails.application.routes.draw do
  
  namespace :staff do
    resources :teachers
  end

  root to: 'home#index'
  
  devise_for :users, only: [:sessions], controllers: {
    sessions: 'users/sessions'
  }
  
  namespace :staff do
    root to: 'home#index'
    get 'home/index'
  end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
