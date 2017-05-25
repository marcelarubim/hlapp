class CreateInstallations < ActiveRecord::Migration[5.1]
  def change
    create_table :installations do |t|
      t.string :code
      t.string :language
      t.string :install_phone
      t.string :gr_qc
      t.string :pabx
      t.integer :status
      t.integer :equipment
      t.integer :guarantee_type
      t.date :delivery_date
      t.date :guarantee_limit
      t.integer :active
      t.integer :inactive
      t.integer :to_collect
      t.integer :registered
      t.references :service, foreign_key: true
      t.references :responsible, foreign_key: true

      t.timestamps
    end
  end
end
