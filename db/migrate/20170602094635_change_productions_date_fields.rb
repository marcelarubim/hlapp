class ChangeProductionsDateFields < ActiveRecord::Migration[5.1]
  def up
    change_column :productions, :airing_month, :string
    change_column :productions, :renew_forecast_month, :string
  end
  def down
    change_column :productions, :airing_month, :date
    change_column :productions, :renew_forecast_month, :date
  end
end
