class DepartmentsController < ApplicationController

  def index

    if params[:f_msg] != nil
      @f_msg = params[:f_msg]
    else
      @f_msg = ''
    end
    @departments = Department.all
    render 'index'
  end

  def display
    @action_method = params[:action_method]
    @f_msg = ''
    
    case @action_method
    when "add" then
      @department = Department.new

    when "edit" then
      @department = Department.find_by(department_id: params[:department_id])
      # binding.pry
    end
  end

  def dep_manage
    @action_method = params[:action_method]
    @f_msg = ''
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
        # binding.pry
      end
      @department.department_id = resultStrId

      unless @department.save then
        @f_msg = '保存できませんでした。' # renderメソッドは、インスタンス変数をテンプレートに渡してくれる
        render 'display' and return
      end
      @f_msg = '新規データを保存しました。'

    when "edit" then
      @department = Department.find_by(department_id: params[:department_id])
      # binding.pry
      # updateメソッドは、成功すると true 失敗するとfalseを返す
      result = @department.update(department_params)
      unless result #falseだったら
        @f_msg = 'データ更新できませんでした。'
        render 'display' and return #renderメソッドは、@f_msgインスタンス変数をテンプレートに渡します
      end
      @f_msg = 'データ更新しました。'

    when "delete" then
      @department = Department.find_by(department_id: params[:department_id])
      @department.destroy
      @f_msg = 'データ削除しました。'
    end
    # 文字列の中に式展開する時には、ダブルクオーテーションで囲ってください
    redirect_to "/departments?f_msg=#{@f_msg}"
  end



  private

  # フォームからは、:department_nameカラムだけ送られて来れば良い
  def department_params
    params.require(:department).permit( :department_name)
  end


end
