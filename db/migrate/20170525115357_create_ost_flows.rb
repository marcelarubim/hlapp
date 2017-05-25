class CreateOstFlows < ActiveRecord::Migration[5.1]
  def change
    create_table :ost_flows do |t|
      t.text :notes
      t.references :ost, foreign_key: true

      t.timestamps
    end
  end
end
