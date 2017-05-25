class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :fullname
      t.string :position
      t.string :telephone
      t.string :mobile
      t.string :email
      t.date :birthday
      t.string :responsible_for
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
