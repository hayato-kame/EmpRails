class EmployeesController < ApplicationController
  def index
    @employees = Employee.page params[:page]

  end

  def display
    @action_method = params[:action_method] #  @をつけてインスタンス変数にする。テンプレートへ送るため
    # renderは、自動で、@の付いたインスタンス変数をテンプレート側に送って来れます
    @f_msg = ''

    case @action_method

    when "add"
      @employee = Employee.new

    when "edit"
      @employee = Employee.find_by(employee_id: params[:employee_id])
      # binding.pry
    end

  end

  def emp_manage
  end
end
