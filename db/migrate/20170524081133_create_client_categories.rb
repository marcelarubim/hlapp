class CreateClientCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :client_categories do |t|
      t.string :name
      t.string :sector

      t.timestamps
    end
  end
end
