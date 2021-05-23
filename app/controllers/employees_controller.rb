class EmployeesController < ApplicationController
  def index
    @employees = Employee.page params[:page]
    if params[:f_msg] != nil
      @f_msg = params[:f_msg]
    else
      @f_msg = ''
    end
  end

  def display
    @action_method = params[:action_method] #  @をつけてインスタンス変数にする。テンプレートへ送るため
    # renderは、自動で、@の付いたインスタンス変数をテンプレート側に送って来れます
    @f_msg = ''
    # all whereメソッド は、Active Record Relationが返る その中の、任意のカラムの配列を取得したい時 pluck メソッドがある 引数にカラム名を指定して使います。
    @department_name_array = Department.all.pluck(:department_name) #セレクトボックスのために必要
    # binding.pry
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
