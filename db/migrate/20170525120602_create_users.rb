class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :cpf
      t.string :rg
      t.string :work_doc
      t.integer :marital_status, default: 0
      t.date :birthday
      t.string :telephone
      t.string :mobile
      t.date :hire_date
      t.date :resignation_date
      t.string :email
      t.string :position
      t.string :login
      t.integer :role, default: 0
      t.boolean :status, default: true
      t.string :password_digest
      t.string :remember_digest

      t.timestamps
    end

    add_index :users, :cpf, unique: true
  end
end
