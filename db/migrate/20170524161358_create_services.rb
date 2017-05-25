class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.integer :courtesy
      t.references :contract, foreign_key: true
      t.references :service_product_variation, index: true

      t.timestamps
    end
  end
end
