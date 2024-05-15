class CreateFactFindings < ActiveRecord::Migration[7.0]
  def change
    create_table :fact_findings do |t|
      t.integer :emp_id
      t.date :date
      t.time :time
      t.string :supervisor
      t.integer :sup_id
      t.string :subject

      t.timestamps
    end
  end
end
