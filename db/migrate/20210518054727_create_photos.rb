class CreatePhotos < ActiveRecord::Migration[6.1]

  # 自動で生成されるidカラムを作らないようにする   id: false
  # このテーブルの主キーは、integerで、:photo_idカラムにするため  参照される側のテーブルの項目はPRIMARY KEYでなくてはならない
  # こっちが主テーブルで、employeesが従テーブル
  # オートインクリメントはつけます!! 主テーブルなので!! こっちをオートインクリメントで管理します
  # そして、primary_key: true   つけます
  def change
    create_table :photos, id: false do |t| #  id: false  つけます
      t.integer :photo_id, primary_key: true, auto_increment: true
      t.string :mime_type, null: true
      t.binary :photo_data

      t.timestamps
    end
  end
end
