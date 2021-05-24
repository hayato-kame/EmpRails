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
      @photo = Photo.new #親データから
      @employee = Employee.new #子データ
    when "edit"
      @employee = Employee.find_by(employee_id: params[:employee_id])
      @photo_data = @employee.photo.photo_data
      @photo_id = @employee.photo_id
      # binding.pry
    end

  end

  def emp_manage
    @f_msg = ""
    @action_method = params[:action_method]
    # binding.pry
    @photo = Photo.new

    # もし、POSTされた画像ファイルデータ(バイナリー)があれば取得しbase64でエンコードする
    if params[:employee][:photo_data] then
      # 一時的に保存してあるところから、読み取ってバイナリーデータを取得する
      @data = File.read params[:employee][:photo_data].tempfile
      # base64エンコードする 表示につかう インスタンス変数にすると、テンプレートに渡せる。
      # @encode_photo_data = Base64.strict_encode64(data)
      # binding.pry
      # @photo.photo_data = photo_data

      @photo.photo_data = params[:employee][:photo_data].read
      @photo.mime_type = params[:employee][:photo_data].content_type

      @photo.save




    end

    # binding.pry
    # HTML上でイメージタグの中に書けば表示される 例
    # img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADIAAAAyCAMAAAAp4XiDAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAA3lBMVEU9Q7jT1O////+xs+JKUL3Fx+ry8vrExuo+RLjx8vpSV8BGTLtDSbqkp96usOFCSLpPVb/29vzY2fHDxelOU77i4/RbYMN/g9A/RblJT7zk5PVfZMViZsXOz+1LUL23uuW8vub39/xESrv19fu5u+WXmtmRlNdQVb/3+PxFSrtITrzk5fXKy+xjaMZpbshLUb3t7fhZXsLj5PVRVr/n5/be3/NrcMnu7/lcYcNCR7qrreCwsuKprOCnqd8/RLnLzex+gtCmqd6Okdbw8PlITbzHyOrq6/eUl9hHTbxrb8n+VD9KAAAAAWJLR0QCZgt8ZAAAAAd0SU1FB+MDFQY4O956N5wAAACwSURBVEjH7dC3EoJAFIXhAyqgsigGzIKYEMw55/j+L+TAoGOxBfb7dff83QUYhmH+wfE8HwLCEUEMBytSNBaPywBREgpBoJJUU2o6A2Q1aFl3yHH5QrFEKx/lSrmqG0DNhFn3lkZTb9HLj7YAWDI6lnfZTleiF1+vDwyGQHGE0dhbJtOZTC+++WK5Wm+ALZHIzh32h+PmRC3fv5ydi34FCre7aLvDw8DTedEKwzBMYG/7KBXMD75mAgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0wMy0yMVQxNTo1Njo1OSswOTowMFEJEK0AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMDMtMjFUMTU6NTY6NTkrMDk6MDAgVKgRAAAAAElFTkSuQmCC"
    # pp params[:employee][:photo_data].content_type
    # "image/jpeg"

    # pp params[:employee][:photo_data].read
    # バイナリーデータが読み取れます

    # pp params[:employee][:photo_data].original_filename
    # "19700101_184450.jpg"

    # pp params[:employee][:photo_data].size
    # サイズが取れます
    # pp params[:employee][:photo_data].tempfile
    # ファイルパス が取れた





    # @employee = Employee.new employee_params

    # if @employee.save
    #   redirect_to 'employee?f_msg=登録しました'
    # else
    #   render 'index', params: {f_msg: '失敗'}
    # end
  end

  private
  # def photo_params #フォームからの許可 :photo_data だけでいい
  #   params.require(:photo).permit( :photo_data ) # photoモデルのためのフォームじゃ無いから違う
  # end

  def employee_params #フォームからの許可
    params.require(:employee).permit(:photo_data, :name, :age, :gender, :photo_id, :zip_number, :pref, :address1, :address2, :address3, :department_id, :hire_date, :retire_date )
  end

end
