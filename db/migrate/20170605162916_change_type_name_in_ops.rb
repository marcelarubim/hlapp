class ChangeTypeNameInOps < ActiveRecord::Migration[5.1]
  def up
    rename_column :ops, :type, :kind
  end
  def down
    rename_column :ops, :kind, :type
  end
end
