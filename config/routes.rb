Rails.application.routes.draw do

  
  
  post "users/resend"
  
  resources :reminders
  resources :users, only: [:new, :create, :show] do
    member do
      post "verify"
      get "verify", to: "users#show_verify"
    end
  end

  get 'welcome/index'

  root to: 'welcome#index'
end
