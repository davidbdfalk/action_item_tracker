class AddProgramCountToBusinessUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :business_units, :programs_count, :integer
  end
end
