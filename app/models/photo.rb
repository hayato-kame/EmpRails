class Photo < ApplicationRecord
  # PhotosControllerは作らない
  # 主データ側になる  従データは、Employeeモデル
  has_one :employee

  attr_accessor :photo_data

  attr_accessor :mime_type
  # バリデーション
  # 1MB（メガバイト）＝1024KB（約100万バイト）   2MB = 2048KB
  # 1GB（ギガバイト）＝1024MB（約10億バイト）


  # validates :photo_data, less_than_or_equal_to: 5.megabyte
  # validates mime_type: { allow: ['image/jpeg', 'image/png', 'image/jpg', 'image/tmp'] }




  # 追加
  def image_url
    "data:#{mime_type};base64,#{Base64.encode64(photo_data)}"
  end

end

# ビューの作成（画像表示）
# <%= image_tag @image.image_url %>
