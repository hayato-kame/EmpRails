Rails.application.routes.draw do

  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'toppages/index'
  get 'toppages', to: 'toppages#index'
  get 'toppages/login_check', to: 'toppages#login_check'

  get 'departments/index'
  get 'departments',  to: 'departments#index'

end
