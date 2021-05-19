class Photo < ApplicationRecord
  # PhotosControllerは作らない
  # 主データ側になる  従データは、Employeeモデル
  has_one :employee

  # バリデーション
  # 1MB（メガバイト）＝1024KB（約100万バイト）   2MB = 2048KB
  # 1GB（ギガバイト）＝1024MB（約10億バイト）
end
