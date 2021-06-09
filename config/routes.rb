Rails.application.routes.draw do


  namespace :department do
    scope "/:career/" do
      resources :academic_charges
      resources :sections
      resources :periods
      resources :teachers, only: [:index]
      root to: "home#index"
    end
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

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
