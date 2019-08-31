class CreatePrograms < ActiveRecord::Migration[5.1]
  def change
    create_table :programs do |t|
      t.string :program
      t.integer :program_manager_id
      t.integer :business_unit_id

      t.timestamps
    end
  end
end
