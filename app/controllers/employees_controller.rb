class EmployeesController < ApplicationController
  def index
    @employees = Employee.page params[:page]

  end

  def display
  end

  def emp_manage
  end
end
