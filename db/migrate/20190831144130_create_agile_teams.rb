class CreateAgileTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :agile_teams do |t|
      t.string :agile_team
      t.integer :scrum_master_id
      t.integer :program_id

      t.timestamps
    end
  end
end
