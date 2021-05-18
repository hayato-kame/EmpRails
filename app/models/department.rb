class Department < ApplicationRecord
  # あとでhas_many

  # バリデーション
  validates :department_name , presence: {message: 'は、必須項目です。'}

end
