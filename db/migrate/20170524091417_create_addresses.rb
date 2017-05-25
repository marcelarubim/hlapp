class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address
      t.integer :num
      t.string :complement
      t.string :district
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps
    end

    add_index :addresses, [:addressable_type, :addressable_id]
  end
end
