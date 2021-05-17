class DepartmentsController < ApplicationController

  def index
    if params['f_msg'] != nil
      @f_msg = params['f_msg']
    else
      @f_msg = ''
    end
    @departments = Department.all
    render 'index'
  end

  def dep_get
    @action_method = params[:action_method]
    # binding.pry

    case @action_method
    when "edit" then
      @department = Department.new

    end


  end

  def dep_post
    @action_method = params[:action_method]
    # binding.pry
    @department = Department.find_by(department_id: params[:department_id])
    pp @department

    case @action_method
    when "delete" then
      @department.destroy
    end
    redirect_to '/departments'
  end
end
