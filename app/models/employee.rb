class Employee < ApplicationRecord
  belongs_toは、従データ側に書く
  belongs_to :department
  belongs_to :photo


  validates :name, :age, :gender, :zipz_number, :pref, :address1, :address2, :address3, :department_id, :hire_date, {presence: {message: 'は、必須項目です。'}}
  validates :name, {length: {maximum: 255, message: 'は、255文字以内で入力してください' }}
  validates :age, {only_integer: {message: 'は、整数値を入れてください。'}, greater_than_or_equal_to: {0, message: 'は、０以上です。'}, less_than: {200, message: 'は、200未満です。'} }
  # 日付のバリデーションをカスタマイズする
  validate :pretend_ago
  validate :retire

  def pretend_ago #メソッド名は任意
    # errors.add(:date型のカラム名, '表示させたいエラーメッセージ') if date型のカラム名.nil? || date型のカラム名 < Date.today
    errors.add(:hire_date, 'は、今日以前の日付を入力してください') if :hire_date.nil? || :hire_date <= Date.today
  end

  def retire #メソッド名は任意  退社日は、 nullも許可されてるので && なおかつ   を使う
    # errors.add(:date型のカラム名, '表示させたいエラーメッセージ') if date型のカラム名.nil? && date型のカラム名 < Date.today
    # もし、退職日が入力してあって、退職日が、入社日よりも前だったら、エラーメッセージ 退職日は、null許容だから
    if :retire_date && :retire_date < :hire_date
    errors.add(:retire_date, 'は、入社日以降の日付を入力してください')
    end
  end


end
