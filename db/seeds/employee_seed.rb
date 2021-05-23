# 子テーブル側なので、テテなし子にならないように、親テーブルphotosに、同じ数だけデータが必要です
# 12データ作成します

# まず、３つ作った。createメソッドの引数には、配列を用意して、１データをハッシュにする 3つのハッシュで3データ作成
Employee.create([
  {employee_id: 'EMP0001', name: '山田 太郎', age: 35, gender: 1, photo_id: 1, zip_number: '100-0001', pref: '東京都',
  address1: '千代田区', address2: '千代田', address3: 'ちよだ', department_id: 'D01', hire_date: '2000-11-11', retire_date: nil},
  {employee_id: 'EMP0002', name: '日本 花子', age: 24, gender: 2, photo_id: 2, zip_number: '330-0841', pref: '埼玉県',
    address1: 'さいたま市', address2: '大宮区', address3: '東町', department_id: 'D03', hire_date: '2010-12-12', retire_date: '2017-09-07'},
  {employee_id: 'EMP0003', name: '東京 次郎', age: 45, gender: 1, photo_id: 3, zip_number: '251-0013', pref: '神奈川県',
    address1: '川崎市', address2: '麻生区', address3: '王禅寺', department_id: 'D03', hire_date: '1999-05-21', retire_date: nil}
])


# 後の９つのデータをループで作成
fnames = ["伊藤", "山本", "中村", "小林"];
gnames = ["三郎", "四郎", "友子"];
pref_array = ["東京都", "千葉県", "茨城県", "神奈川県"];
dep_id_array = ["D01", "D02", "D03"];

9.times do |n| # ブロック引数のnは、0から8まで渡される
  str_emp_id = sprintf("EMP%04d", (n + 4) )  #これで  EMP0004 から  EMP0012  まで作れる
  e_name = "#{fnames[(n+1) % 4]} #{gnames[(n+1) % 3]}"
  e_gender = ""
  if e_name.include?("友子")
    e_gender = 2 #女
  else
    e_gender = 1 #男
  end
  str_zip_number = sprintf("%03d", (n+1)*3) + '-' + sprintf("%04d", (n+1)*4)
  random_address_array = Employee.get_random(5)
  # 配列の要素を連結して文字列化する
  e_address = random_address_array.join
  h_date = (Time.local(2017,7,5)+ 24*60*60*n).strftime("%Y-%m-%d")
  r_date = (Time.now - 24*60*60*n).strftime("%Y-%m-%d")
  Employee.create(
    { employee_id: str_emp_id,
      name: e_name,
      age: rand(18..80),
      gender: e_gender,
      photo_id: n + 4,
      zip_number: str_zip_number,
      pref: pref_array[(n+1) % 3],
      address1: e_address,
      address2: e_address,
      address3: e_address,
      department_id: dep_id_array[(n+1) % 3],
      hire_date: h_date,
      retire_date: r_date }
  )
end
