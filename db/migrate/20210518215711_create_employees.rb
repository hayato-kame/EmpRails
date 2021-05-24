class CreateEmployees < ActiveRecord::Migration[6.1]

  # このテーブルの主キーは、Stringで、:employee_idカラムにするため、
  # idカラムが自動生成されないようにする id: false  としてます
  # このテーブルは、departmentsテーブルに対して、の従テーブルになります cascade はつけない つけない
  # このテーブルは、photosテーブルに対して、の従テーブルになります cascade をつける！！
  # employee_idカラムに、オートインクリメントはつけません(タイプがstringだから) primary_key: trueだけつけます


  def change
    create_table :employees, id: false do |t|    #  id: false  つけます

      t.string :employee_id, primary_key: true

      t.string :name, limit: 50
      t.integer :age
      t.integer :gender

      # Railsのマイグレーションで外部キー制約を表現するためには、

      # 基本はt.references :<参照先>, foreign_key: trueを使う  (オプションがあれば、trueを消してオプションを書く)
      # これで解決できない場合は、add_foreign_key :<参照元>, :<参照先>, column: :<カラム名>で対応する


      # 外部キーのフィールドだから これだけでいい相手は主キーでもあるので、null: false は要らない
      # t.referencesは使わず、下で行う
      t.integer :photo_id

      # t.referencees :photo で、photo_idというカラムを作成してくれます そしてindexを自動で付与してくれます
      # これだけだと、外部キー制約はつかないので foreign_key: true をつけます。null: false と記述することで、NOT NULL制約をつけることができます。
      # t.references :photo で photosテーブルを参照することを宣言します

      # reference型を使うメリット  :photo とかいて photo_idカラムを作成し、
      # インデックスを自動ではる  ただし、これだけでは、外部キー制約はつかない
      # そして、今回は、foreign_key: trueを設定しないでください

      # foreign_key: trueを設定すると photo_id  を参照します ただし、主キーは、自動生成のidの場合だけ使える　オプションがあるので trueのところを消して、ハッシュにする
      # これだと、エラーになった、photos.idは無いと言われるので foreign_key: true は設定しないこと 主キーは自動生成で作らないので
      # cascadeで 参照元 (子テーブルemployeesテーブルのデータが) が削除された場合、参照しているテーブル(親テーブルphotosのデータ)を削除するようになります。
      # cascadeは、下でつけます
      # t.references :photo, null:false

      t.string :zip_number, limit: 20
      t.string :pref, limit: 20
      t.string :address1, limit: 100
      t.string :address2, limit: 100
      t.string :address3, limit: 100

      # 外部キーのフィールドだから ここにはこれだけでいい、相手は、主キーにもなるのでnull: false もいらない
      # t.referencesは使わず、下で行う
      t.string :department_id

      # t.referencees :department で、department_idというカラムを作成してくれます そしてindexを自動で付与してくれます
      # これだけだと、外部キー制約はつかない foreign_key: true が使用できますが。ただし、主キーは、自動生成のidの場合だけ使える
      # オプションがあれば trueのところを消して、ハッシュにする
      # 今回は、foreign_key: true はつけないでください
      # null: false と記述することで、NOT NULL制約をつけることができます。
      # t.references :department で departmentsテーブルを参照することを宣言します
      # cascadeはつけないこと  foreign_key: true つけないこと
      # t.references :department, null:false
      # null: true はつけるとおかしくなるかも

      t.datetime :hire_date
      t.datetime :retire_date

      t.timestamps
    end

    #  on_delete: :cascade  つける
    # cascadeで 参照元 (子テーブルemployeesテーブルのデータが) が削除された場合、参照しているテーブル(親テーブルphotosのデータ)を削除するようになります。
    add_foreign_key :employees, :photos, column: :photo_id, primary_key: :photo_id, on_delete: :cascade

    #  on_delete: :cascade  つけません！
    # add_foreign_key :参照元テーブル(子), :参照先テーブル(親), column: :参照するカラム , primary_key: :参照するテーブルの主キー
    add_foreign_key :employees, :departments, column: :department_id, primary_key: :department_id
  end
end
