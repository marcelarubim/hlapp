class CreateOpFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :op_flows do |t|
      t.text :notes
      t.references :op, foreign_key: true

      t.timestamps
    end
  end
end
