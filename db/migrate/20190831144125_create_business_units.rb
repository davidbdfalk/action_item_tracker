class CreateBusinessUnits < ActiveRecord::Migration[5.1]
  def change
    create_table :business_units do |t|
      t.string :business_unit
      t.integer :director_id
      t.integer :operating_unit_id

      t.timestamps
    end
  end
end
