class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.date :date
      t.integer :old_num
      t.date :renewal_date
      t.date :cancellation_date
      t.text :cancellation_reason
      t.integer :status
      t.string :category
      t.string :pay_method
      t.string :language
      t.boolean :narrator_type
      t.string :audio_format
      t.integer :tt_prod_contracted
      t.integer :tt_points_contracted
      t.integer :archiving_status
      t.references :client, foreign_key: true, index: true

      t.timestamps
    end
  end
end
