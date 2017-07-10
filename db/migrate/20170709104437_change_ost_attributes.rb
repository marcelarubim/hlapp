class ChangeOstAttributes < ActiveRecord::Migration[5.1]
  def up
    remove_column :osts, :solicitant
    rename_column :osts, :intalled_qty, :installed_qty
    rename_column :osts, :cquality_date, :qc_date
    rename_column :osts, :type, :kind
  end
  def down
    add_column :osts, :solicitant, :string
    rename_column :osts, :installed_qty, :intalled_qty
    rename_column :osts, :qc_date, :cquality_date
  end
end
