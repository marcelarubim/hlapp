class ChangeInstallationsAttributes < ActiveRecord::Migration[5.1]
  def up
    remove_column :installations, :active
    remove_column :installations, :inactive
    remove_column :installations, :to_collect
    remove_column :installations, :registered
  end
  def down
    add_column :installations, :active, :integer
    add_column :installations, :inactive, :integer
    add_column :installations, :to_collect, :integer
    add_column :installations, :registered, :integer
  end
end
