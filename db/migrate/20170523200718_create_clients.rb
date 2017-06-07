class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :business_name
      t.string :legal_name
      t.string :cnpj
      t.string :telephone
      t.string :fax
      t.string :website
      t.string :month_anniversary
      t.date :welcome_letter
      t.string :referrer
      t.references :category, foreign_key: true
      t.references :seller, foreign_key: true
      t.references :captured_by, foreign_key: true
      t.references :telemarketing, foreign_key: true

      t.timestamps
    end
  end
end
