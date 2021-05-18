class CreateEmployees < ActiveRecord::Migration[6.1]

  # このテーブルの主キーは、Stringで、:employee_idカラムにするため、
  # idカラムが自動生成されないようにする id: false  としてます
  # このテーブルは、departmentsテーブルに対して、の従テーブルになります cascade はつけない つけない
  # このテーブルは、photosテーブルに対して、の従テーブルになります cascade をつける！！
  # employee_idカラムに、オートインクリメントはつけません(タイプがstringだから) primary_key: trueだけつけます


  def change
    create_table :employees, id: false do |t|    #  id: false  つけます

      t.string :employee_id, primary_key: true

      t.string :name
      t.integer :age
      t.string :gender

      # Railsのマイグレーションで外部キー制約を表現するためには、

      # 基本はt.references :<参照先>, foreign_key: trueを使う  (オプションがあれば、trueを消してオプションを書く)
      # これで解決できない場合は、add_foreign_key :<参照元>, :<参照先>, column: :<カラム名>で対応する


      # 外部キーのフィールドだから
      # t.integer :photo_id   とは書かないで

      # t.referencees :photo で、photo_idというカラムを作成してくれます そしてindexを自動で付与してくれます
      # これだけだと、外部キー制約はつかないので foreign_key: true をつけます。null: false と記述することで、NOT NULL制約をつけることができます。
      # t.references :photo で photosテーブルを参照することを宣言します
      # foreign_key: trueを設定すると photo_id  を参照します オプションがあるので trueのところを消して、ハッシュにする
      # cascadeで 参照元 (親テーブルphotos) が削除された場合、参照しているテーブル(子テーブル employees)を削除するようになります。
      t.references :photo, null:false, foreign_key: {on_delete: :cascade}

      t.string :zip_number
      t.string :pref
      t.string :address1
      t.string :address2
      t.string :address3

      # 外部キーのフィールドだから ここには
      # t.string :department_id   とは書かないで、

      # t.referencees :department で、department_idというカラムを作成してくれます そしてindexを自動で付与してくれます
      # これだけだと、外部キー制約はつかないので foreign_key: true をつけます。オプションがあれば trueのところを消して、ハッシュにする
      # null: false と記述することで、NOT NULL制約をつけることができます。
      # t.references :department で departmentsテーブルを参照することを宣言します

      t.references :department, null:false, foreign_key: true

      t.datetime :hire_date
      t.datetime :retire_date

      t.timestamps
    end


  end
end
