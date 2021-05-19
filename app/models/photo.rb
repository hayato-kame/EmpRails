class Photo < ApplicationRecord
  # PhotosControllerは作らない
  # 主データ側になる  従データは、Employeeモデル
  has_one :employee

  # バリデーション
  # 1MB（メガバイト）＝1024KB（約100万バイト）   2MB = 2048KB
  # 1GB（ギガバイト）＝1024MB（約10億バイト）


  # validates :photo_data, {null: true , file_size: { less_than_or_equal_to: 5.megabyte },
  # file_content_type: { allow: ['image/jpeg', 'image/png', 'image/jpg', 'image/tmp'] }}


  
  # validates :photo_data, {null: true, size_limit: { limit: 5.megabyte }}

  # validates :mime_type, {null: true, content_type: { allow_content_type: ['image/jpeg', 'image/png', 'image/jpg', 'image/tmp'] }}

  # 追加
  def image_url
    "data:#{content_type};base64,#{Base64.encode64(image)}"
  end

end

# ビューの作成（画像表示）
# <%= image_tag @image.image_url %>
