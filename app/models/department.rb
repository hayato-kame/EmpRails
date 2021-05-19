class Department < ApplicationRecord
  # 主データですhas_many
  has_many :employee

  # バリデーション
  validates :department_name , presence: {message: 'は、必須項目です。'}

end
