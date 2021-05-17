Rails.application.routes.draw do

  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'toppages/index'
  get 'toppages', to: 'toppages#index'
  get 'toppages/login_check', to: 'toppages#login_check'


  get 'departments/index'
  get 'departments',  to: 'departments#index'
  get 'departments/dep_get'
  post 'departments/dep_get'
  # ()は必須パラメータでないことを表す
  post 'departments/dep_post(/:department_id)', to: 'departments#dep_post'

  get 'departments/dep_post(/:department_id)', to: 'departments#dep_post'



end
