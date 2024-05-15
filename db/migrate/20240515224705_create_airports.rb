class CreateAirports < ActiveRecord::Migration[7.0]
  def change
    create_table :airports do |t|
      t.string :base
      t.string :airport

      t.timestamps
    end
  end
end
