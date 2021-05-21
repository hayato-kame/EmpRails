# 子テーブル側なので、テテなし子にならないように、親テーブルphotosに、同じ数だけデータが必要です
# 12データ作成します

Employee.create(
  {employee_id: 'EMP0001', name: '山田 太郎', age: 35, gender: '男', photo_id: 1, zip_number: '100-0001', pref: '東京都',
  address1: '千代田区', address2: '千代田', address3: 'ちよだ', department_id: 'D01', hire_date: '2000-11-11', retire_date: nil},
  {employee_id: 'EMP0002', name: '日本 花子', age: 24, gender: '女', photo_id: ２, zip_number: '330-0841', pref: '埼玉県',
    address1: 'さいたま市', address2: '大宮区', address3: '東町', department_id: 'D03', hire_date: '2010-12-12', retire_date: '2017-09-07'},
  {employee_id: 'EMP0003', name: '東京 次郎', age: 45, gender: '男', photo_id: 3, zip_number: '251-0013', pref: '神奈川県',
    address1: '川崎市', address2: '麻生区', address3: '王禅寺', department_id: 'D03', hire_date: '1999-05-21', retire_date: nil}
)

fnames = ["伊藤", "山本", "中村", "小林"];
gnames = ["三郎", "四郎", "友子"];
pref_aray = ["東京都", "千葉県", "茨城県", "神奈川県"];
dep_id_array = ["D01", "D02", "D03"];



(1..9).times do |n|

  str_emp_id = sprintf("EMP%04d", (n + 3) )  #これで  EMP0004 から  EMP0012  まで作れる
  e_name = "${fnames[n % 4]}" + " " + "${gnames[n % 3]"
  e_gender = ""
  if name.include?("友子")　then
    e_gender = "女"
  else
    e_gender = "男"
  end
  str_zip_number = sprintf("%03d", n*3) + sprintf("%04d", n*4)
  random_address = self.get_ramdom(5)
  h_date = Time.new.strftime("%Y-%m-%d")
  r_date = (h_date + n.days).strftime("%Y-%m-%d")
  # date = date.strftime("%Y-%m-%d")


  Employee.create(
    {employee_id: :str_emp_id, name: :e_name, age: rand(18..80), gender: :e_gender, photo_id: n + 3, zip_number: :str_zip_number,
    pref: pref_array[n % 3], address1: :random_address, address2: :random_address, address3: :random_address, department_id: dep_id_array[n % 3],
    hire_date: :h_date, retire_date: :r_date}
  )


end

private
def get_ramdom(n)
  hiragana = ["ぁ","あ","ぃ","い","ぅ","う","ぇ","え","ぉ","お",
    "か","が","き","ぎ","く","ぐ","け","げ","こ","ご",
    "さ","ざ","し","じ","す","ず","せ","ぜ","そ","ぞ",
    "た","だ","ち","ぢ","っ","つ","づ","て","で","と","ど",
    "な","に","ぬ","ね","の","は","ば","ぱ",
    "ひ","び","ぴ","ふ","ぶ","ぷ","へ","べ","ぺ","ほ","ぼ","ぽ",
    "ま","み","む","め","も","ゃ","や","ゅ","ゆ","ょ","よ",
    "ら","り","る","れ","ろ","ゎ","わ","ゐ","ゑ","を","ん"]
  str = hiragana.sample(n)
end