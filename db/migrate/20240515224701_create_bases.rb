class CreateBases < ActiveRecord::Migration[7.0]
  def change
    create_table :bases do |t|
      t.string :base
      t.boolean :cobase

      t.timestamps
    end
  end
end
