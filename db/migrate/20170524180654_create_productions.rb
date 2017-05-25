class CreateProductions < ActiveRecord::Migration[5.1]
  def change
    create_table :productions do |t|
      t.string :theme
      t.date :airing_month
      t.date :renew_forecast_month
      t.string :details
      t.references :service, foreign_key: true
      t.references :op, foreign_key: true

      t.timestamps
    end
  end
end
