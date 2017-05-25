class CreateOsts < ActiveRecord::Migration[5.1]
  def change
    create_table :osts do |t|
      t.integer :status
      t.integer :type
      t.date :program_date
      t.date :service_execution_date
      t.date :cquality_date
      t.integer :service_method
      t.string :solicitant
      t.string :complain
      t.string :defects
      t.integer :repair_status
      t.boolean :equip_replaced
      t.integer :intalled_qty
      t.integer :collected_qty
      t.integer :product_evaluation
      t.references :installation, foreign_key: true
      t.references :executor, foreign_key: true
      t.references :attendant, foreign_key: true

      t.timestamps
    end
  end
end
