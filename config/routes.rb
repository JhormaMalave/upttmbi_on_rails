Rails.application.routes.draw do
  namespace :department do
    resources :academic_charges
    resources :sections
    resources :periods
  end
  
  namespace :staff do
    resources :users
    resources :careers
    resources :teachers
    resources :subjects
    resources :teacher_careers
    resources :teacher_degrees
    root to: 'home#index'
    get 'home/index'
  end

  root to: 'home#index'
  
  devise_for :users, only: [:sessions], controllers: {
    sessions: 'users/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
