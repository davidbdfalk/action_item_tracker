class AddAgileTeamCountToPrograms < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :agile_teams_count, :integer
  end
end
