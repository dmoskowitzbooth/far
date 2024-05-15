class CreateSupervisors < ActiveRecord::Migration[7.0]
  def change
    create_table :supervisors do |t|
      t.integer :sup_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :conference_number

      t.timestamps
    end
  end
end
