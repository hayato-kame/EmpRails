Rails.application.routes.draw do

  devise_for :accounts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'toppages#index'
  get 'toppages/index'
  get 'toppages', to: 'toppages#index'
  get 'toppages/login_check', to: 'toppages#login_check'


  get 'departments/index'
  get 'departments',  to: 'departments#index'
  # ()は必須パラメータでないことを表す フォーム送信のところに department_id: @department.department_id あるから、任意パラメータにする
  get 'departments/display(/:department_id)', to: 'departments#display'
  post 'departments/display'
  # ()は必須パラメータでないことを表す
  post 'departments/dep_manage(/:department_id)', to: 'departments#dep_manage'

  get 'departments/dep_manage(/:department_id)', to: 'departments#dep_manage'

  get 'employees/index', to: 'employees#index'
  get 'employees', to: 'employees#index'

  get 'employees/emp_manage(/:department_id)', to: 'employees#display'
  
  post 'employees/emp_manage(/:department_id)', to: 'employees#emp_manage'



end
