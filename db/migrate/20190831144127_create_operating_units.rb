class CreateOperatingUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :operating_units do |t|
      t.string :operating_unit
      t.integer :vice_president_id

      t.timestamps
    end
  end
end
