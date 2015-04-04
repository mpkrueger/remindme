Rails.application.routes.draw do
  resources :reminders

  get 'welcome/index'

  root to: 'welcome#index'
end
