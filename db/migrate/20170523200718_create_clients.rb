class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :legal_name
      t.string :cnpj
      t.string :telephone
      t.string :fax
      t.string :website
      t.integer :month_anniversary
      t.date :welcome_letter
      t.string :referrer

      t.timestamps
    end
  end
end
