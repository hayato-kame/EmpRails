class Employee < ApplicationRecord
  # belongs_toは、従データ側に書く
  belongs_to :department
  belongs_to :photo


  validates :name, :age, :gender, :zip_number, :pref, :address1, :address2, :address3, :department_id, :hire_date, {presence: {message: 'は、必須項目です。'}}
  validates :name, {length: {maximum: 255, message: 'は、255文字以内で入力してください' }}

  validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 200}
  # 性別は、integer型で、1 男性   2 女性
  validates :gender, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 2}

  # 日付のバリデーションをカスタマイズする 入社日は、必須項目であればいい、上でつけてる 退社日は、独自のバリデーション
  validate :retire

  def retire #メソッド名は任意  退社日は、 nullも許可されてるので && なおかつ   を使う 未入力だったらスルー
    # もし、退職日が入力してあって、退職日が、入社日よりも前だったら、エラーメッセージ 退職日は、null許容だから
    if :retire_date && :retire_date < :hire_date
    errors.add(:retire_date, 'は、入社日以降の日付を入力してください')
    end
  end

# シードファイル employee_seed.rbファイル で使う  クラスメソッド 静的メソッド インスタンス化しなくても呼び出せるメソッド
# self.メソッド名で定義する
def self.get_random(n)
    hiragana = ["ぁ","あ","ぃ","い","ぅ","う","ぇ","え","ぉ","お",
      "か","が","き","ぎ","く","ぐ","け","げ","こ","ご",
      "さ","ざ","し","じ","す","ず","せ","ぜ","そ","ぞ",
      "た","だ","ち","ぢ","っ","つ","づ","て","で","と","ど",
      "な","に","ぬ","ね","の","は","ば","ぱ",
      "ひ","び","ぴ","ふ","ぶ","ぷ","へ","べ","ぺ","ほ","ぼ","ぽ",
      "ま","み","む","め","も","ゃ","や","ゅ","ゆ","ょ","よ",
      "ら","り","る","れ","ろ","ゎ","わ","ゐ","ゑ","を","ん"]
    str = hiragana.sample(n)
    # binding.pry
    return str
  end




end
