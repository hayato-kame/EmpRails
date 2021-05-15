class CreateDepartments < ActiveRecord::Migration[6.1]


  # このテーブルの主キーは、Stringで、:department_idカラムにするため、
  # idカラムが自動生成されないようにする id: false  としてます
  # このテーブルは、employeesテーブルに対して、の主テーブルになります
  # オートインクリメントはつけません primary_key: trueだけつけます

  def change
    create_table :departments, id: false do |t|   #  id: false を追加した
      t.string :department_id , limit: 20, primary_key: true  # primary_key: trueを追加
      t.string :department_name , limit: 20, null: false

      # タイムスタンプを作らないようにする
      # t.timestamps
    end
  end
end
