# 注意  親テーブルなので、子テーブルと同じだけのデータが必要です。なので、12 です
# 子テーブルのデータ数のループ回数にする
12.times do |n|
  Photo.create(
    {mime_type: nil, photo_data: nil},
  )
end