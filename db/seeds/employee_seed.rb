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
prefArray = ["東京都", "千葉県", "茨城県", "神奈川県"];
departmentIdArray = ["D01", "D02", "D03"];



(1..9).times do |n|

  str_emp_id = sprintf("EMP%04d", (n + 3) )  #これで  EMP0004 から  EMP0012  まで作れる
  # もし友子だったら性別は"女"になるようにする
  


  Employee.create(
    {}
  )
end