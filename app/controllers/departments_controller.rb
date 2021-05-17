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
    when "add" then
      @department = Department.new
      # @department.department_id = ''
      # @department.department_name = ''
      # binding.pry
    when "edit" then

    end


  end

  def dep_post
    @action_method = params[:action_method]
    # binding.pry

    # @department = Department.find_by(department_id: params[:department_id])
    # pp @department

    case @action_method
    when "add" then
      @department = Department.new department_params
      # binding.pry
      # 部署IDを作成する
      last = Department.order(department_id: :asc).last
      # binding.pry
      resultStrId = "D01" #初期値
      if last
        strId = last.department_id
        num = (strId[-2,2].to_i)+1
        resultStrId = sprintf("D%02d",num)
        binding.pry
      end
      @department.department_id = resultStrId

      unless @department.save then
        render 'dep_get'

      end

    when "delete" then
      @department.destroy
    end
    redirect_to '/departments'
  end



  private

  # フォームからは、:department_nameカラムだけ送られて来れば良い
  def department_params
    params.require(:department).permit( :department_name)
  end


end
