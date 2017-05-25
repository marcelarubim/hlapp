class CreateServiceProductVariations < ActiveRecord::Migration[5.1]
  def change
    create_table :service_product_variations do |t|
      t.references :service_type, index: true
      t.references :product_type, index: true
      t.references :variation_type, index: true
      t.boolean :var_required, default: false

      t.timestamps
    end
  end
end
