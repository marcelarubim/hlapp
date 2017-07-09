class CreateFluxes < ActiveRecord::Migration[5.1]
  def change
    create_table :fluxes do |t|
      t.text :notes
      t.integer :fluxable_id
      t.string :fluxable_type

      t.timestamps
    end

    add_index :fluxes, [:fluxable_type, :fluxable_id]

  end
end
