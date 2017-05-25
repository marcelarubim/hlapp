class CreateOps < ActiveRecord::Migration[5.1]
  def change
    create_table :ops do |t|
      t.string :narrator
      t.string :language
      t.string :track
      t.integer :type
      t.integer :process_phase
      t.integer :status
      t.integer :priority
      t.date :briefing_date
      t.date :max_delivery_date
      t.date :text_delivery_date
      t.date :text_approving_date
      t.date :recording_date
      t.date :demo_delivery_date
      t.date :demo_approving_date
      t.date :studio_release_date
      t.references :contract, foreign_key: true
      t.references :solicitant, foreign_key: true
      t.references :text_approver, foreign_key: true
      t.references :comun_executor, foreign_key: true
      t.references :studio_executor, foreign_key: true
      t.references :editor, foreign_key: true

      t.timestamps
    end
  end
end
