class AddBusinessUnitCountToOperatingUnits < ActiveRecord::Migration[5.1]
  def change
    add_column :operating_units, :business_units_count, :integer
  end
end
