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
  end

  def dep_post
  end
end
