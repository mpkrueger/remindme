Rails.application.routes.draw do

  get "users/verify", to: "users#show_verify", as: 'verify'
  post "users/verify"
  post "users/resend"
  
  resources :reminders
  resources :users, only: [:new, :create, :show]

  get 'welcome/index'

  root to: 'welcome#index'
end
